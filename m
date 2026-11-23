Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DBD8606A31E
	for <ath12k@archiver.kernel.org>; Mon, 23 Nov 2026 13:50:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=gIQyyHeb;
	dkim=pass (2048-bit key) header.d=bairaktaris.de header.i=@bairaktaris.de header.a=rsa-sha256 header.s=google header.b=ah7PQGUk
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=6HVhuJO5sWXcG8AHtCleMZpnq8VDkE7D2E0LYlxDAms=; b=gIQyyHebNHf9Xt7+mXQiQuAvxI
	q6XuRITJfh3+I10PCn7i8sHO/ui77JaiAcFp3wLuaXCmKZF/4ADRgwpZiDAEGjVLpI70fn4Iqt4g7
	S4tT2ND+pYtbenWMr6OwZmgSa7ZIGbwWFfb2YRZqcDjsoKFuXdcakrzxVkhQF4mTwv3Zn6+FTgPNu
	k9/klva1nEpFr316ejGKxiq+tEDtsJfas8qqsX9joMDeSsrXvgNpGYSJIj9NJYbj27r76WV+HU6DB
	SUuQ9HrWHtYsxf7tYUWKntSOvmIzQj+O+Sdngz1hQGCzh6mzDGJI4MBnFkOyWU5Wjofru3gmTl0X8
	LAe/yfWA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVUQz-00000003dI6-4BTh;
	Mon, 23 Nov 2026 13:50:17 +0000
Received: from mail-ej1-x62c.google.com ([2a00:1450:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVUQv-00000003dGK-35pM
	for ath12k@lists.infradead.org;
	Mon, 23 Nov 2026 13:50:15 +0000
Received: by mail-ej1-x62c.google.com with SMTP id a640c23a62f3a-c516a574bffso197129766b.3
        for <ath12k@lists.infradead.org>; Mon, 23 Nov 2026 05:50:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bairaktaris.de; s=google; t=1795441812; x=1796046612; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=6HVhuJO5sWXcG8AHtCleMZpnq8VDkE7D2E0LYlxDAms=;
        b=ah7PQGUkP4EPR21hMJxWQGqegrp/8mRSR/BYrrKsWFlnRCgtGuRsigEaC0aFcfrD7k
         oEoa12P1WJdMY20fSWD/YM6hzbwF0Ri/WvZUBuEM8xRqdQE12ILNhAix0bWAMDZ2mL0j
         wAsmvbD9ViorxbEUhp+oci7C4DcyEtu8OuCuFJkflvHsptnYto63aj0mbI2LEF2gvHdO
         VwUygkj7CIaZsHyy7AJoWkAKF89GCkVQPkMApbXHiU6+wDr08A0vQo8NcdjsOsdcy8zY
         SK0mCs673IFXEOSa7CN0gK02n64oXnd03vvxC+K2u86hkOm+Q72YJs25oD1X8v50Lb/A
         O8yQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795441812; x=1796046612;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6HVhuJO5sWXcG8AHtCleMZpnq8VDkE7D2E0LYlxDAms=;
        b=lZj4Y7FO/uu+Qj4AHS/P27HE6AUM1FRAtHgqdyRnwvJK9spSl0KfL07sGBtaDzX2vl
         t78IBI81fsDj/PpFiziWOqIIz/zfWQSvHQ3WQVaebBrDx+cz+nguilA1C/zHZynFxgga
         3bJibnnQSAQlxUnT524m6V88vrWG5TOjen7gXm4wUZKqciN0yxCHbliu5HLhNLM0xE8e
         UBBX+TgIpD7CyPY5kCWqbqzJSjAAy7IwogIihMfegZ5BRKKC9FP60aPr8cCIkK/XhzB+
         vxKS9E1YEm3PBgg6LSkbBwzyE8py6lqWI4KovGZ9WZRwB70TNX77WRcgje2P30SZnTlK
         PdUg==
X-Forwarded-Encrypted: i=1; AL+hErFUvwZa2e8xcd0nyhFDYjlLJPeANMH3/IuENASqxyXrmbjoaYIG+bs3e2Rd5RTh/V2Ogb5iWrk=@lists.infradead.org
X-Gm-Message-State: APuU4Z/DIdDUTIQ/tRb8r8MwQhYZNRcShpvLW8CE9k0vc/XMeOHpXru2
	KVMdVPBBHO5Xqw2QVAPiPoPBXnbHMebc4HZpj1yDfIJ1tH1ybMgVhKteplTQWZOwZA==
X-Gm-Gg: AZFdTZctd6pS3TlS64bVc0xgAaZu/GR3SVxYQbY1ti9DoRERpv91lO1BhXQe81ipGRv
	+MC9rJ+KlzysmBfA+b5NIOnWY6DM7AE76pYT+spxQELfLQG9aLhN3J1oa6x6w5bCCmDnBfo7VV9
	sbbiqOgrgaxx+kcWdTGcHtCChnEpJKnxzC44VPhnIeVgLl5XLdTErCBruZIu8f2igU6PbiEsqgJ
	IVwUJNztmr9QVLFbZJLfPkfDEg5U6fCJi1JXd8v95hA10Nb2ABTb95yqFxWibiJPOELXcmcVU7o
	7+MnrYVscIU9k0YbJYrUBiMQ+CDiuhIWajSMoPBFaaB7PDEvmVZvlVn+hJieRMILUUiVMSJSdYU
	lbIw0uE8uQUGW5zkZ8qIOwLa5/SUyHp5dHv9PfqX5Ovb+NphJC43RYt0i6d3CDdDP2HMEQkkpPG
	wrtJnhWMMiSvrKWapVUVXfLz1KZoSDMocOI9calMZxOuUuBtiRJY1RIf6CAtgan5W2LvJFw+kvF
	6Ik9YIsMe3FbCvzdYxNUfqGVvJfeo7l6iuXk5alKo6k8xt7ORthMajh6JVmJWqNavUjnYWXeim6
	uZL8wXkw07f5ddO+p9jWDGybC74odXRBSOSfyWWVXYwj5P68+DiUidvfUSj/nw8yQGuanozW8K7
	2p9/H9QnCyaQxX7ch9ZdPp+i5S4r1pUYn5lI3G2RfvTw9xhCy/+5SrgRvJyaykKHablk1a6K7rM
	nNznBUYZu03vyahvG/GDQisxViKGe9VG8/2K59E5GwQ/5cxbSuRHp8Phadb9M3YG5JL9aZDkw3r
	iWL7eOPNGzmSeS8XArKB9sTDcvKX8OBM2FslxaxPnhOFO/77UGZZbF8ax5uFpeJf1yCm4bjch8u
	Ycw+PWHC6qTK3pevz6lX9ZLTQnpUUhKeFVxj5zSk0w013sACGOjDinYgAw73sKhQZu0gkQ5P5w=
	=
X-Received: by 2002:a17:906:8a63:b0:c1c:4a80:30c4 with SMTP id a640c23a62f3a-c513a99a66amr712771366b.11.1795441811767;
        Mon, 23 Nov 2026 05:50:11 -0800 (PST)
Received: from Desktop.tail070c67.ts.net (p200300f247012000e9a6b19fb24a0d13.dip0.t-ipconnect.de. [2003:f2:4701:2000:e9a6:b19f:b24a:d13])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6ba370fa8a4sm5357732a12.21.2026.11.23.05.50.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 05:50:11 -0800 (PST)
From: Julius Bairaktaris <julius@bairaktaris.de>
To: Jeff Johnson <jjohnson@kernel.org>,
	Johannes Berg <johannes@sipsolutions.net>
Cc: ath11k@lists.infradead.org,
	ath12k@lists.infradead.org,
	linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Baochen Qiang <baochen.qiang@oss.qualcomm.com>,
	Rameshkumar Sundaram <rameshkumar.sundaram@oss.qualcomm.com>,
	Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>,
	P Praneesh <praneesh.p@oss.qualcomm.com>,
	Sriram R <sriram.ramachandran@oss.qualcomm.com>,
	Karthikeyan Periyasamy <karthikeyan.periyasamy@oss.qualcomm.com>,
	Sowmiya Sree Elavalagan <quic_ssreeela@quicinc.com>,
	Sathishkumar Muruganandam <quic_murugana@quicinc.com>,
	Maharaja Kennadyrajan <quic_mkenna@quicinc.com>,
	Balamurugan Selvarajan <quic_bselvara@quicinc.com>,
	Venkateswara Naralasetty <quic_vnaralas@quicinc.com>,
	Govindaraj Saminathan <quic_gsamin@quicinc.com>,
	Wen Gong <quic_wgong@quicinc.com>,
	Carl Huang <quic_cjhuang@quicinc.com>,
	John Crispin <john@phrozen.org>,
	Pradeep Kumar Chitrapu <quic_pradeepc@quicinc.com>,
	Ramya Gnanasekar <quic_rgnanase@quicinc.com>
Subject: [RFC PATCH ath-next 0/3] wifi: ath11k: merge the TCP segments of a station in the REO reap
Date: Mon, 23 Nov 2026 14:50:07 +0100
Message-ID: <20261123135010.721107-1-julius@bairaktaris.de>
X-Mailer: git-send-email 2.53.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261123_055013_821055_2F6F678A 
X-CRM114-Status: GOOD (  15.63  )
X-Spam-Score: -2.1 (--)
X-BeenThere: ath12k@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <ath12k.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/ath12k/>
List-Post: <mailto:ath12k@lists.infradead.org>
List-Help: <mailto:ath12k-request@lists.infradead.org?subject=help>
List-Subscribe: <https://lists.infradead.org/mailman/listinfo/ath12k>,
 <mailto:ath12k-request@lists.infradead.org?subject=subscribe>
Sender: "ath12k" <ath12k-bounces@lists.infradead.org>
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

With Ethernet rx decap, ath11k hands every MSDU of a REO reap to
ieee80211_rx_napi() on its own. mac80211 runs its 802.3 receive path for
it (station and fast_rx lookup, station and netdev counters, control port
check, internal forward lookup) and passes it to napi_gro_receive(), where
TCP GRO on the netdev parses it again and adds it to the aggregate it is
building. A TCP upload of one station at 850 Mbit/s is about 70,000
frames a second through both.

3/3 merges the consecutive segments of one TCP stream of one station and
TID of a reap in the driver, as GRO on the netdev would, and hands the
run to mac80211 as one GSO frame. I would like to know whether this is
the right layer before going further, so this is an RFC.

Why in the driver and not GRO per MSDU: on a Xiaomi AX3600 (IPQ8074,
four Cortex-A53) routing a TCP upload of one HE160 station at
852 Mbit/s, without the merge, a CPU profile (one run) has the GRO
functions (dev_gro_receive(), tcp_gro_receive(), inet_gro_receive(),
tcp4_gro_receive() and their helpers) at 7.9 % of all samples, the
mac80211 802.3 receive path at 5.2 %, and the second peer lookup that
the RX cost series [1] removes at 1.7 %. With the merge, in a profile of
the same upload at 814 Mbit/s (one run, with further datapath changes of
mine on OpenWrt), GRO is at 1.0 %, the mac80211 receive path at 1.4 %,
and the merge functions themselves at 2.7 %. The driver already has what
a merge needs per MSDU (the station, TID and receive status of each
frame, in ring order) before mac80211 sees the frame, so joining a
segment is one header comparison.

What stays per MSDU: every frame still passes ath11k_dp_rx_process_msdu()
and ath11k_dp_rx_h_mpdu() before it can join, so the run is built only
from frames that would take the 802.3 path on their own. A frame joins
only with a receive status identical to the run's (so the decryption and
PN-validated flags are those of every segment), with no FCS or MIC
error, unicast, not EAPOL (those take the 802.11 path), not of a
4-address station, in one buffer, with a TCP checksum the hardware
verified, and with the Ethernet header of the run, so the source address
mac80211 checks is the one of every segment. ath11k has no decap offload
on mesh interfaces, so mesh is not merged. A frame that does not join
ends the run before it is handled, so order is kept and nothing is held
across reaps.

Counters: 1/3 makes ieee80211_rx_8023() count a TCP GSO frame as its
gso_segs packets, fragments and MSDUs and add the headers of the merged
segments to the byte counts, for the station and the netdev. It also
fixes the internal forward of such a frame to another station, which
today sets ETH_P_802_3 and the network header on the MAC header, so
validate_xmit_skb() fails to segment it and drops it. 2/3 exports the
netdev a station's 802.3 frames reach (its AP_VLAN netdev if it has
one), so the driver can decide as GRO there would: no merge with GRO off
or an XDP program, a frame list with rx-gro-list unless a local socket
takes the stream, else a frame with fragments, up to the netdev's GRO
size.

Alternatives I see, and would follow if preferred:
- a batched receive call in mac80211 that takes a list of 802.3 frames
  of one station, does the per-station work once and merges in
  __ieee80211_rx_handle_8023(), so every driver with decap offload gets
  it (ieee80211_rx_list() today takes one frame per call);
- keeping GRO per MSDU and making each step cheaper (a hardware skb
  hash so GRO finds its flow without hashing, no second peer lookup,
  both in [1]), which keeps most of the 13 % above.
ath12k has the same per-MSDU path and would get the same change once
the layer is agreed; it also looks the peer up twice per MSDU (in
ath12k_wifi7_dp_rx_h_mpdu() and ath12k_dp_rx_deliver_msdu()).

The merge joins only frames whose TCP checksum the hardware verified,
which relies on the RX checksum fix of the RX correctness series [2].

1/3 and 2/3 are mac80211 changes, for wireless-next. The merge acts only
with Ethernet decap (frame_mode=2); with the native Wi-Fi default nothing
changes. The series applies on top of the RX cost
series [1], whose page_pool RX buffers the fragment form takes over and
whose single peer lookup gives the station of each frame; [1] applies
on the RX correctness series [2].

The same changes ran on the AX3600 with OpenWrt's 6.18 kernel and
wireless backports, together with further datapath changes of mine,
with frame_mode=2. Over a run of routed and bridged TCP up- and
download, IPv4 and IPv6, with one HE160 station, the driver merged
14,640,275 segments into 1,359,382 frames (10.8 per frame), and the
kernel log stayed clean. Station to station on one radio, the stream
that mac80211 forwards internally ran at 3.8 / 4.3 Mbit/s with the merge
before the forward fix in 1/3, and at 83.4 / 99.0 Mbit/s with it,
against 81.6 / 99.5 Mbit/s without the merge (one run each; the second
station's link is the limit).

[1] https://lore.kernel.org/all/20261123134137.718575-1-julius@bairaktaris.de/
[2] https://lore.kernel.org/all/20261122210525.2076058-1-julius@bairaktaris.de/

I used Claude (Anthropic) to help write these patches.
I have reviewed the commit messages and the cover letter myself and edited
them where needed.

Julius Bairaktaris (3):
  wifi: mac80211: count the segments of a received GSO frame
  wifi: mac80211: tell a driver the netdev a station's 802.3 frames
    reach
  wifi: ath11k: merge the TCP segments of a station in a REO reap

 drivers/net/wireless/ath/ath11k/core.h    |   3 +
 drivers/net/wireless/ath/ath11k/debugfs.c |   4 +
 drivers/net/wireless/ath/ath11k/dp_rx.c   | 444 +++++++++++++++++++++-
 include/net/mac80211.h                    |  17 +
 net/mac80211/rx.c                         |  70 +++-
 5 files changed, 530 insertions(+), 8 deletions(-)


base-commit: 1983b40acfcb3c3464b291c85977290a785bcfdc
prerequisite-patch-id: ed566369a9bbda0ac9a48357261e8cfe1cc0f1d1
prerequisite-patch-id: 726d7737c833da0842192eccececad4a0dedb1a6
prerequisite-patch-id: cf0b8ff1ac6cef681433247e4b937a3e23af78a3
prerequisite-patch-id: 03c89df01745ac9a80653431261f9a003dbca7db
prerequisite-patch-id: cb48c0eddbe0c2fe176e8edc94c6bc40be3c48a9
prerequisite-patch-id: 1956ec85ad80b68868538070fc0e89c29603467a
prerequisite-patch-id: a66e3c439fe1341f83075e5687361fdb197cfe5a
prerequisite-patch-id: 3e5becdd444369ceebf7128696f32b9c7575cdae
prerequisite-patch-id: 09d8e8e4d5db48209df13c50b0bceadc913f1b36
prerequisite-patch-id: a665dc2d623226337224372a5bc7e3e78be9c96e
prerequisite-patch-id: 7cbac21c92659e4da6c3e708271517b65d7a5272
prerequisite-patch-id: d615376a310af6a446929dd935dfa6d7576b7cb4
prerequisite-patch-id: 291642da9c3994bb7deacb428c37d0ec8eb121ae
prerequisite-patch-id: 09359a8fb405612c1ef37addfa8a8518bad32fcc
prerequisite-patch-id: 7ef0f31a73ea2a5c875e2c1a233a4db18c4ed8d1
prerequisite-patch-id: 5d75f6dfac0bc5ccb54a9e2fdcd0583381c158eb
-- 
2.53.0


