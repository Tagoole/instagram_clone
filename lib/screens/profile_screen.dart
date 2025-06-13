import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> with TickerProviderStateMixin {
  late TabController _tabController;
  bool isFollowing = false;

  // Sample profile data
  final profileData = {
    'username': 'AP_Tagoole',
    'displayName': 'AP_&_Tagoole',
    'bio': 'FullStack Developers 👩‍💻 💻\n🚀⚙️ Backend Dev\n📧 ap.tagoole@gmail.com',
    'website': 'www.full-stack-dev.com',
    'isVerified': true,
    'stats': {
      'posts': 14,
      'followers': 2340,
      'following': 8,
    }
  };

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  String formatNumber(int number) {
    if (number >= 1000000) {
      return '${(number / 1000000).toStringAsFixed(1)}M';
    } else if (number >= 1000) {
      return '${(number / 1000).toStringAsFixed(1)}K';
    }
    return number.toString();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            // Header
            _buildHeader(),
            
            // Profile Info
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    _buildProfileInfo(),
                    _buildStoryHighlights(),
                    _buildTabBar(),
                    _buildTabContent(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: const BoxDecoration(
        border: Border(bottom: BorderSide(color: Colors.grey, width: 0.2)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            onTap: () => Navigator.pop(context),
            child: const Icon(Icons.arrow_back, size: 24),
          ),
          Row(
            children: [
              Text(
                profileData['username'] as String,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              ),
              if (profileData['isVerified'] as bool) ...[
                const SizedBox(width: 4),
                Container(
                  width: 16,
                  height: 16,
                  decoration: const BoxDecoration(
                    color: Colors.blue,
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(
                    Icons.check,
                    color: Colors.white,
                    size: 10,
                  ),
                ),
              ],
            ],
          ),
          const Icon(Icons.more_horiz, size: 24),
        ],
      ),
    );
  }

  Widget _buildProfileInfo() {
    final stats = profileData['stats'] as Map<String, int>;
    
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Avatar and Stats Row
          Row(
            children: [
              // Avatar
              Container(
                width: 80,
                height: 80,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: Colors.grey.shade300, width: 2),
                ),
                child: ClipOval(
                  child: Image.asset(
                    'assets/images/pearl_of_africa.png', // Replace with your avatar image
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) {
                      return Container(
                        color: Colors.grey.shade300,
                        child: const Icon(Icons.person, size: 40),
                      );
                    },
                  ),
                ),
              ),
              
              const SizedBox(width: 20),
              
              // Stats
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    _buildStatColumn('Posts', stats['posts']!),
                    _buildStatColumn('Followers', stats['followers']!),
                    _buildStatColumn('Following', stats['following']!),
                  ],
                ),
              ),
            ],
          ),
          
          const SizedBox(height: 16),
          
          // Name and Bio
          Text(
            profileData['displayName'] as String,
            style: const TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 14,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            profileData['bio'] as String,
            style: const TextStyle(fontSize: 14),
          ),
          const SizedBox(height: 4),
          Text(
            profileData['website'] as String,
            style: const TextStyle(
              fontSize: 14,
              color: Colors.blue,
            ),
          ),
          
          const SizedBox(height: 16),
          
          // Action Buttons
          Row(
            children: [
              Expanded(
                child: ElevatedButton(
                  onPressed: () {
                    setState(() {
                      isFollowing = !isFollowing;
                    });
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: isFollowing ? Colors.white : Colors.blue,
                    foregroundColor: isFollowing ? Colors.black : Colors.white,
                    side: isFollowing ? const BorderSide(color: Colors.grey) : null,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(6),
                    ),
                  ),
                  child: Text(isFollowing ? 'Following' : 'Follow'),
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: OutlinedButton(
                  onPressed: () {},
                  style: OutlinedButton.styleFrom(
                    side: const BorderSide(color: Colors.grey),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(6),
                    ),
                  ),
                  child: const Text('Message', style: TextStyle(color: Colors.black)),
                ),
              ),
              const SizedBox(width: 8),
              OutlinedButton(
                onPressed: () {},
                style: OutlinedButton.styleFrom(
                  side: const BorderSide(color: Colors.grey),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(6),
                  ),
                  minimumSize: const Size(40, 36),
                ),
                child: const Icon(Icons.person_add_outlined, color: Colors.black),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildStatColumn(String label, int count) {
    return GestureDetector(
      onTap: () {
        // Handle stat tap (navigate to followers/following)
        print('Tapped on $label');
      },
      child: Column(
        children: [
          Text(
            formatNumber(count),
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            label,
            style: const TextStyle(
              fontSize: 14,
              color: Colors.grey,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStoryHighlights() {
    return Container(
      height: 90,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          // Add New Highlight
          Column(
            children: [
              Container(
                width: 60,
                height: 60,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: Colors.grey.shade300, width: 2, style: BorderStyle.solid),
                ),
                child: const Icon(Icons.add, color: Colors.grey),
              ),
              const SizedBox(height: 4),
              const Text('New', style: TextStyle(fontSize: 12, color: Colors.grey)),
            ],
          ),
          const SizedBox(width: 16),
          
          // Sample Highlights
          ...List.generate(4, (index) {
            final highlights = ['JAVA☕', 'C++', 'Python-Django', 'Firebase🔥'];
            return Padding(
              padding: const EdgeInsets.only(right: 16),
              child: Column(
                children: [
                  Container(
                    width: 60,
                    height: 60,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(color: Colors.grey.shade300, width: 2),
                    ),
                    child: ClipOval(
                      child: Image.network(
                        'https://picsum.photos/80/80?random=${index + 20}',
                        fit: BoxFit.cover,
                        errorBuilder: (context, error, stackTrace) {
                          return Container(
                            color: Colors.grey.shade300,
                            child: const Icon(Icons.image),
                          );
                        },
                      ),
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    highlights[index],
                    style: const TextStyle(fontSize: 12, color: Colors.grey),
                  ),
                ],
              ),
            );
          }),
        ],
      ),
    );
  }

  Widget _buildTabBar() {
    return TabBar(
      controller: _tabController,
      indicatorColor: Colors.black,
      indicatorWeight: 1,
      tabs: const [
        Tab(icon: Icon(Icons.grid_on, color: Colors.grey)),
        Tab(icon: Icon(Icons.play_arrow, color: Colors.grey)),
        Tab(icon: Icon(Icons.person_outline, color: Colors.grey)),
      ],
    );
  }

  Widget _buildTabContent() {
    return SizedBox(
      height: 400, // Fixed height for the tab content
      child: TabBarView(
        controller: _tabController,
        children: [
          _buildPostsGrid(),
          _buildReelsGrid(),
          _buildTaggedGrid(),
        ],
      ),
    );
  }

  Widget _buildPostsGrid() {
    return GridView.builder(
      padding: const EdgeInsets.all(1),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        crossAxisSpacing: 1,
        mainAxisSpacing: 1,
      ),
      itemCount: 12,
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () {
            // Navigate to post detail
            print('Tapped post $index');
          },
          child: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage('https://picsum.photos/300/300?random=$index'),
                fit: BoxFit.cover,
              ),
            ),
            child: index % 4 == 0
                ? const Align(
                    alignment: Alignment.topRight,
                    child: Padding(
                      padding: EdgeInsets.all(4),
                      child: Icon(
                        Icons.play_arrow,
                        color: Colors.white,
                        size: 16,
                      ),
                    ),
                  )
                : null,
          ),
        );
      },
    );
  }

  Widget _buildReelsGrid() {
    return GridView.builder(
      padding: const EdgeInsets.all(1),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        crossAxisSpacing: 1,
        mainAxisSpacing: 1,
      ),
      itemCount: 6,
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () {
            print('Tapped reel $index');
          },
          child: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage('https://picsum.photos/300/300?random=${index + 20}'),
                fit: BoxFit.cover,
              ),
            ),
            child: const Stack(
              children: [
                Positioned(
                  top: 4,
                  right: 4,
                  child: Icon(Icons.play_arrow, color: Colors.white, size: 16),
                ),
                Positioned(
                  bottom: 4,
                  left: 4,
                  child: Text(
                    '2.1K',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 10,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildTaggedGrid() {
    return const Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.person_outline,
            size: 64,
            color: Colors.grey,
          ),
          SizedBox(height: 16),
          Text(
            'No Tagged Posts Yet',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w600,
              color: Colors.grey,
            ),
          ),
          SizedBox(height: 8),
          Text(
            'When people tag you in photos,\nthey\'ll appear here.',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 14,
              color: Colors.grey,
            ),
          ),
        ],
      ),
    );
  }
}