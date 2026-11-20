Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CCAB606A320
	for <ath12k@archiver.kernel.org>; Fri, 20 Nov 2026 07:09:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=nN/HSKWl;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=D9um5Vz/;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=JaJ63WfV
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=UuIMgIXaNSGyfL1Y4Rh63ojF60kjSTFpeR+uZHJN5Yw=; b=nN/HSKWlX+z/xmrmtkoCo5H1cg
	hXwAV7hX17APN+Tg73B4dsn3bqBA399jPOzaFJsQdCd4f26r/ICLmE5Xt0KuLx4eMS6Q/cha/OPz7
	kvqIfoeNvgUngzsTMgq7PMcJZyd8jH1ooQZELAJAA2ZoSfU7HdmHkFLftpxrmIGlflPsnL+Qiaj88
	i5dznCqvZ7yA3yy0SGc4yrmVq3SYHQq5xxVZjEyJyQrw0A/8gE6V9L2nR0dUYmv6En/kr7NZH8RlP
	cFFBjIhJq8zETTK+RCGFDKD7OU+9nOMr9tHHHvR4bGI1kNRKQruzPq3UE+5+e2pmyzrIY5sM7JM0y
	fx80RNww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUIkH-0000000ECin-1Dwu;
	Fri, 20 Nov 2026 07:09:17 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUIkB-0000000ECiF-1pyY
	for ath12k@lists.infradead.org;
	Fri, 20 Nov 2026 07:09:13 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AK3VFaj2143534
	for <ath12k@lists.infradead.org>; Fri, 20 Nov 2026 07:09:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=UuIMgIXaNSGyfL1Y4Rh63ojF60kjSTFpeR+
	uZHJN5Yw=; b=D9um5Vz/DrHjtqSblFGAn8XcTP3F+Qyo7KmGzcPT++sQ1tPdGNc
	pdjO+UdQcPDhEjVpW2pOOzEJEA5UV/C1cw4SkZqxeJmnoCouuVdJYYTkJzaVp6oV
	vMJIF6cl4KQZqLWxGVaI0O2lD/Uk3QFFFXedx+U+b+cEQAMvD0psGnzWBjGPW1QH
	b+/B3bPrqWCQaaFGJEPFuKOFa7vzHZu1SEh8H8C3/w+9xO23Wa64v8mlnpmuvzwV
	I2JGVv4vDQlk0U+S2njku5iz79BfneMt0ZmZ9ojR5F2mv8+4Rl3hZ7DIjqnLlsep
	9IP8KBif/ETzQlA8U2U81Uf6UgloZF4EKAQ==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j27au2cwn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Fri, 20 Nov 2026 07:09:10 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-3b4139b7abcso763406a91.3
        for <ath12k@lists.infradead.org>; Thu, 19 Nov 2026 23:09:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795158549; x=1795763349; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=UuIMgIXaNSGyfL1Y4Rh63ojF60kjSTFpeR+uZHJN5Yw=;
        b=JaJ63WfVoLfrt9npkTid4D4zOA4q6gSjFdqRrsOv3cwcSh7or4KqobqREQSqMgOv63
         f1gPeQKWO8UhFu0X9G0wU7slI9WeIgOo8sIdh9Qp5uVCqiLyLQsjQtgdoOSk/7u8ICtC
         ODo+V/hPSz5aoYlVmPQ3ItDCFRBooiKKFO9Difoj+6zpcD+IhtA1K6zXiPZRIFXVy8Q/
         ZlVnVUuvGeN1rn3QkivQtom8nL3/3DlRFtCR0RYYIQXk/Eazfuy6t95ELm0BIyESNftX
         5bEwV5uJe6k7miD5N1zOPY7kSLtwLEbuY6joe6jywc0bwuyAmAW8OF+A3xa9L2wIP9jg
         D8Gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795158549; x=1795763349;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UuIMgIXaNSGyfL1Y4Rh63ojF60kjSTFpeR+uZHJN5Yw=;
        b=sKrISNdlmILUjA4RzATtks7yI2kkPePuEdO/RKZILAQV3KPVNvxutKNkmxRgDItmuw
         IJEpCJhzLsIlFvgI7wHyjEpnHMLrnbjvpGkFjxRKLNp/IdVZsPYn2aTnOjRedO24EsMT
         Gjqe3vFQss/XENNW6HRrKiZkDOEhLJGO0RJfGz2NNaTLJ8xKVE36v/RFw3k3xXYQUxPL
         SfxdjfJY1f8wGYD8QkcMo23FC/54QYgW3I0V7YLvjXQ12Q/BAS/czQAZgV2/fjHi64rg
         zpPXyYdzlnzfWRMWAjTJSvoX71V+9XrE4LxNA5mVlgcBqri7Thnsd4eYxsnQUhi0lHY2
         +e1A==
X-Gm-Message-State: APuU4Z8oLHgLTy9P0zOjVgLkJSXTLjG8uvObigpmXw5kZvjojWE6V0Su
	N3LMd7gQ3MXSKv8wH9N8w5PyuJKWbQcKc3nBRXESAReatWSWTnPE6jV4nChGNU5UIildilD9Qzj
	lr8cAtg+kWWqYdbYG8zBxbMnX50Ptjaf3FbBR32ECLBQpajchScXFiu7BPVKLTd0miKrLsIOr
X-Gm-Gg: AZFdTZfs/JQIGOef9w3MsvBJv3jk/vteMD54AILKA4pdqlWkchvPsEO/LrIgRpxdraP
	IMaRS1azGHT10pCo0/moYBeiTF/UqgGLTV+ja6Ay+C5kpEbPhUQfdMKIyvefDsYZBUaeejjqKc9
	zdZKepsYEaks1atp4VcrEFoxM/TjEkgaaZc5MrIAimXo9FXXlUQg6/DW5WUjAdrgRslU+MRcBHX
	csX3Bb7pYqEZ3OGUjo1rH8C57egYaDTFVbUWPzW4GsNrlxp9j1pL5N1fh1/2bjy6SIiaHzvcH5+
	+8kXTUNvu4ffhed5lAaiv+8xniILSjXjyGw+Z3zqHk3Olrk6EVCgvlmNyhMPnwBDAvJn7iBTp8L
	j5LAwNqV5Y8DTXVJ/tX68hvV7H0dCHFty6MMw+/sm62bGbUbCzfpNC5L2ynMIeytyxZEBGMiIFH
	iewqYeaJfjJ0FTFY3E+J6FSakJjsIQuQLzNr3vTH9eJOqdwa9JMTT7P5jkGy9wuw0=
X-Received: by 2002:a17:90b:388b:b0:3b4:574:3bd6 with SMTP id 98e67ed59e1d1-3b41c982e09mr1817118a91.66.1795158548845;
        Thu, 19 Nov 2026 23:09:08 -0800 (PST)
X-Received: by 2002:a17:90b:388b:b0:3b4:574:3bd6 with SMTP id 98e67ed59e1d1-3b41c982e09mr1817090a91.66.1795158548235;
        Thu, 19 Nov 2026 23:09:08 -0800 (PST)
Received: from hu-aisr-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b41d22aaeesm1057062a91.3.2026.11.19.23.09.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 23:09:07 -0800 (PST)
From: Aishwarya R <aishwarya.r@oss.qualcomm.com>
To: ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org, Aishwarya R <aishwarya.r@oss.qualcomm.com>,
        Harsh Kumar Bijlani <harsh.bijlani@oss.qualcomm.com>,
        Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Subject: [PATCH ath-next v2] wifi: ath12k: add hash table for peer lookup in struct  ath12k_dp_hw
Date: Fri, 20 Nov 2026 12:39:00 +0530
Message-Id: <20261120070900.541279-1-aishwarya.r@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIwMDAyOCBTYWx0ZWRfXyrDopSJyvuhL
 Flf4Mfs35mHAkCzjxzxYD0UORXcgSbHpJXfdACmMYlq3EwfywWXgqF8aZeeD+Mdgd7QP97N5CyV
 36HMKTDhnV692JFPVlnocRlUj4T6R1HdsQfuWXNUArvBtg9+MvjzTwQKU737krOpd+zkLZlcQHz
 8wKvc40FpF4n15kf6TZlU1k+jiWi8SGA4VDHZ3R6QxL1sj13d1yPpdFKSfEDTe2vD5ZA6CM/Mmq
 /ZGQqO/94K4loqRCNeYJh15qfIhNON4p1cS8Kck2/4MXTvJBsO4weOMVn4PyIjWJ8Ylq0NxRuRl
 kY6E1+vbcmdl7puIf/H9jXMqbBisPPACY4tgKjJGBfIjbMCX5of8SC3TZXGz2JIPrHm0JITSKcD
 h5AZpp276nva+2EyFUuyn2dFJf3GmYKM8HX/+G2ySMROU9zJdB8AZfsuxSmaG3y4EqllxBtFTZ4
 1aG4ePoFyeK/8dzWH/Q==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIwMDAyOCBTYWx0ZWRfXwAi6l3hJgr5m
 HHZS9hHQz/8IE4+tS75oS9FTW31nyI3c7rVGa1MBt2DjnAYtZZ8YvxC7QnGQskKExdbexX15hH7
 aftLrONkH/DIxOmAZSEECldE5bcXTsk=
X-Proofpoint-ORIG-GUID: HeNjVEC1zElZzyqIJCs9CD4ecQ1dYe9x
X-Proofpoint-GUID: HeNjVEC1zElZzyqIJCs9CD4ecQ1dYe9x
X-Authority-Analysis: v=2.4 cv=KuHYSmWN c=1 sm=1 tr=0 ts=6afff216 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=e0xTfCGfjV48Ql1BNNoA:9 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-20_02,2026-11-19_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 lowpriorityscore=0 impostorscore=0
 priorityscore=1501 bulkscore=0 adultscore=0 spamscore=0 suspectscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611200028
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261119_230911_815108_8815ED41 
X-CRM114-Status: GOOD (  24.43  )
X-Spam-Score: -2.8 (--)
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
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Peer lookup by MAC address in struct ath12k_dp_hw is currently performed by
walking the dp_peers_list, resulting in O(n) lookup complexity. As the
driver supports up to 1536 clients, frequent lookups on critical paths
such as TX/RX processing, peer management, control operations and
debug/statistics handling can incur noticeable overhead in dense
deployment scenarios.

Replace the peer list with a generic kernel hash table for MAC address
based peer management and lookup, providing O(1) average-case lookup
performance. The hash table is implemented using DECLARE_HASHTABLE()
with 2048 buckets (2^11), derived from
order_base_2(ATH12K_MAX_DEVICES * ATH12K_MAX_CLIENTS), and uses jhash()
over the peer MAC address as the hash key.

The hash table is used both for address-based lookups and peer
traversal operations, eliminating the need for maintaining a separate
peer list.

The maximum single-radio client limit is defined as
ATH12K_MAX_CLIENTS and reused by the memory profile and hardware
params. This keeps the peer hash sizing aligned with the per-device
client limit and the maximum number of devices in a hardware group.

Key changes:
- Add peer_hash table to ath12k_dp_hw and initialize it during
  hardware allocation.
- Add hash_node to ath12k_dp_peer for hash table membership.
- Introduce helper APIs for hash computation, insertion, deletion and
  lookup.
- Convert MAC-address-based peer searches from list traversal to
  hash-table lookup.
- Replace peer list traversal with hash table iteration.

Peer creation inserts the peer into the hash table, while deletion
removes it from the hash table. Peer cleanup paths are updated to
iterate over the hash table and safely free peer objects.

Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.6-01243-QCAHKSWPL_SILICONZ-1

Co-developed-by: Harsh Kumar Bijlani <harsh.bijlani@oss.qualcomm.com>
Signed-off-by: Harsh Kumar Bijlani <harsh.bijlani@oss.qualcomm.com>
Signed-off-by: Aishwarya R <aishwarya.r@oss.qualcomm.com>
Reviewed-by: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
---
Changes in v2:
- Rebased the changes
---
 drivers/net/wireless/ath/ath12k/cmn_defs.h |  2 +
 drivers/net/wireless/ath/ath12k/core.c     |  2 +-
 drivers/net/wireless/ath/ath12k/dp_cmn.h   | 14 ++++++-
 drivers/net/wireless/ath/ath12k/dp_peer.c  | 47 ++++++++++++++++++----
 drivers/net/wireless/ath/ath12k/dp_peer.h  |  7 +++-
 drivers/net/wireless/ath/ath12k/mac.c      | 20 ++++-----
 drivers/net/wireless/ath/ath12k/wifi7/hw.c | 10 ++---
 7 files changed, 76 insertions(+), 26 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/cmn_defs.h b/drivers/net/wireless/ath/ath12k/cmn_defs.h
index 20208ffea1c9..15c5e8d11afc 100644
--- a/drivers/net/wireless/ath/ath12k/cmn_defs.h
+++ b/drivers/net/wireless/ath/ath12k/cmn_defs.h
@@ -10,6 +10,8 @@
 
 #define MAX_RADIOS 2
 #define ATH12K_MAX_DEVICES 3
+#define ATH12K_MAX_CLIENTS 512
+
 #define ATH12K_GROUP_MAX_RADIO (ATH12K_MAX_DEVICES * MAX_RADIOS)
 
 #define ATH12K_SCAN_MAX_LINKS	ATH12K_GROUP_MAX_RADIO
diff --git a/drivers/net/wireless/ath/ath12k/core.c b/drivers/net/wireless/ath/ath12k/core.c
index 719200759ca0..6e0bb1fecc09 100644
--- a/drivers/net/wireless/ath/ath12k/core.c
+++ b/drivers/net/wireless/ath/ath12k/core.c
@@ -44,7 +44,7 @@ static const struct
 ath12k_mem_profile_based_param ath12k_mem_profile_based_param[] = {
 [ATH12K_QMI_MEMORY_MODE_DEFAULT] = {
 		.num_vdevs = 17,
-		.max_client_single = 512,
+		.max_client_single = ATH12K_MAX_CLIENTS,
 		.max_client_dbs = 128,
 		.max_client_dbs_sbs = 128,
 		.dp_params = {
diff --git a/drivers/net/wireless/ath/ath12k/dp_cmn.h b/drivers/net/wireless/ath/ath12k/dp_cmn.h
index 88abe90767eb..ff011fafc175 100644
--- a/drivers/net/wireless/ath/ath12k/dp_cmn.h
+++ b/drivers/net/wireless/ath/ath12k/dp_cmn.h
@@ -6,6 +6,7 @@
 #ifndef ATH12K_DP_CMN_H
 #define ATH12K_DP_CMN_H
 
+#include <linux/hashtable.h>
 #include "cmn_defs.h"
 
 struct ath12k_hw_group;
@@ -18,12 +19,21 @@ struct ath12k_dp_link_peer;
  */
 #define MAX_DP_PEER_LIST_SIZE  16384
 
+/*
+ * The hash table supports ATH12K_MAX_DEVICES * ATH12K_MAX_CLIENTS clients;
+ * order_base_2() gives 2048 hash buckets.
+ */
+#define ATH12K_DP_PEER_HASH_BITS \
+	order_base_2(ATH12K_MAX_DEVICES * ATH12K_MAX_CLIENTS)
+
 struct ath12k_dp_hw {
 	struct ath12k_dp_peer __rcu *dp_peers[MAX_DP_PEER_LIST_SIZE];
 
-	/* Lock for protection of dp_peer_list and peers */
+	/* Lock for protection of dp_peers[] and peer_hash */
 	spinlock_t peer_lock;
-	struct list_head dp_peers_list;
+
+	/* Generic hash table for fast MAC address lookup */
+	DECLARE_HASHTABLE(peer_hash, ATH12K_DP_PEER_HASH_BITS);
 };
 
 struct ath12k_dp_hw_group {
diff --git a/drivers/net/wireless/ath/ath12k/dp_peer.c b/drivers/net/wireless/ath/ath12k/dp_peer.c
index 4e753e6abe3a..5dc7f08e6292 100644
--- a/drivers/net/wireless/ath/ath12k/dp_peer.c
+++ b/drivers/net/wireless/ath/ath12k/dp_peer.c
@@ -4,6 +4,7 @@
  * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
  */
 
+#include <linux/jhash.h>
 #include "core.h"
 #include "dp_peer.h"
 #include "debug.h"
@@ -371,30 +372,58 @@ void ath12k_dp_link_peer_rhash_delete(struct ath12k_dp *dp,
 			    peer->addr, peer->peer_id, ret);
 }
 
+static u32 ath12k_dp_peer_addr_hash(const u8 *addr)
+{
+	return jhash(addr, ETH_ALEN, 0);
+}
+
 struct ath12k_dp_peer *ath12k_dp_peer_find_by_addr(struct ath12k_dp_hw *dp_hw, u8 *addr)
 {
-	struct ath12k_dp_peer *peer;
+	struct ath12k_dp_peer *dp_peer;
+	u32 hash;
 
 	lockdep_assert_held(&dp_hw->peer_lock);
 
-	list_for_each_entry(peer, &dp_hw->dp_peers_list, list) {
-		if (ether_addr_equal(peer->addr, addr))
-			return peer;
+	hash = ath12k_dp_peer_addr_hash(addr);
+	hash_for_each_possible(dp_hw->peer_hash, dp_peer, hash_node, hash) {
+		if (ether_addr_equal(dp_peer->addr, addr))
+			return dp_peer;
 	}
 
 	return NULL;
 }
 EXPORT_SYMBOL(ath12k_dp_peer_find_by_addr);
 
+static void ath12k_dp_peer_hash_table_add(struct ath12k_dp_hw *dp_hw,
+					  struct ath12k_dp_peer *dp_peer)
+{
+	u32 hash;
+
+	lockdep_assert_held(&dp_hw->peer_lock);
+
+	hash = ath12k_dp_peer_addr_hash(dp_peer->addr);
+	hash_add(dp_hw->peer_hash, &dp_peer->hash_node, hash);
+}
+
+void ath12k_dp_peer_hash_table_delete(struct ath12k_dp_hw *dp_hw,
+				      struct ath12k_dp_peer *dp_peer)
+{
+	lockdep_assert_held(&dp_hw->peer_lock);
+
+	hash_del(&dp_peer->hash_node);
+}
+
 struct ath12k_dp_peer *ath12k_dp_peer_find_by_addr_and_sta(struct ath12k_dp_hw *dp_hw,
 							   u8 *addr,
 							   struct ieee80211_sta *sta)
 {
 	struct ath12k_dp_peer *dp_peer;
+	u32 hash;
 
 	lockdep_assert_held(&dp_hw->peer_lock);
 
-	list_for_each_entry(dp_peer, &dp_hw->dp_peers_list, list) {
+	hash = ath12k_dp_peer_addr_hash(addr);
+	hash_for_each_possible(dp_hw->peer_hash, dp_peer, hash_node, hash) {
 		if (ether_addr_equal(dp_peer->addr, addr) && (dp_peer->sta == sta))
 			return dp_peer;
 	}
@@ -408,10 +437,12 @@ static struct ath12k_dp_peer *ath12k_dp_peer_create_find(struct ath12k_dp_hw *dp
 							 bool mlo_peer)
 {
 	struct ath12k_dp_peer *dp_peer;
+	u32 hash;
 
 	lockdep_assert_held(&dp_hw->peer_lock);
 
-	list_for_each_entry(dp_peer, &dp_hw->dp_peers_list, list) {
+	hash = ath12k_dp_peer_addr_hash(addr);
+	hash_for_each_possible(dp_hw->peer_hash, dp_peer, hash_node, hash) {
 		if (ether_addr_equal(dp_peer->addr, addr)) {
 			if (!sta || mlo_peer || dp_peer->is_mlo ||
 			    dp_peer->sta == sta)
@@ -517,7 +548,7 @@ int ath12k_dp_peer_create(struct ath12k_dp_hw *dp_hw, u8 *addr,
 
 	spin_lock_bh(&dp_hw->peer_lock);
 
-	list_add(&dp_peer->list, &dp_hw->dp_peers_list);
+	ath12k_dp_peer_hash_table_add(dp_hw, dp_peer);
 
 	/*
 	 * For an MLO client whose ML peer ID is allocated by the host, the
@@ -555,7 +586,7 @@ void ath12k_dp_peer_delete(struct ath12k_dp_hw *dp_hw, u8 *addr,
 	    dp_peer->peer_id != ATH12K_MLO_PEER_ID_PENDING)
 		rcu_assign_pointer(dp_hw->dp_peers[dp_peer->peer_id], NULL);
 
-	list_del(&dp_peer->list);
+	ath12k_dp_peer_hash_table_delete(dp_hw, dp_peer);
 
 	spin_unlock_bh(&dp_hw->peer_lock);
 
diff --git a/drivers/net/wireless/ath/ath12k/dp_peer.h b/drivers/net/wireless/ath/ath12k/dp_peer.h
index 2ac4c6c6d535..0a2b9d1814a5 100644
--- a/drivers/net/wireless/ath/ath12k/dp_peer.h
+++ b/drivers/net/wireless/ath/ath12k/dp_peer.h
@@ -127,7 +127,6 @@ void ath12k_dp_link_peer_extended_event(struct ath12k_base *ab, u8 vdev_id,
 					u8 logical_link_id, u8 valid);
 
 struct ath12k_dp_peer {
-	struct list_head list;
 	bool is_mlo;
 	bool dp_setup_done;
 
@@ -164,6 +163,9 @@ struct ath12k_dp_peer {
 	struct ath12k_dp_rx_tid rx_tid[IEEE80211_NUM_TIDS + 1];
 
 	bool use_4addr;
+
+	/* Hash table node for MAC address lookup */
+	struct hlist_node hash_node;
 };
 
 struct ath12k_dp_link_peer *
@@ -212,4 +214,7 @@ ath12k_dp_link_peer_get_sta(const struct ath12k_dp_link_peer *link_peer)
 	return link_peer && link_peer->dp_peer ?
 		link_peer->dp_peer->sta : NULL;
 }
+
+void ath12k_dp_peer_hash_table_delete(struct ath12k_dp_hw *dp_hw,
+				      struct ath12k_dp_peer *dp_peer);
 #endif
diff --git a/drivers/net/wireless/ath/ath12k/mac.c b/drivers/net/wireless/ath/ath12k/mac.c
index a247dcf387de..51ee44e72abf 100644
--- a/drivers/net/wireless/ath/ath12k/mac.c
+++ b/drivers/net/wireless/ath/ath12k/mac.c
@@ -1277,16 +1277,20 @@ void ath12k_mac_peer_cleanup_all(struct ath12k *ar)
 
 void ath12k_mac_dp_peer_cleanup(struct ath12k_hw *ah)
 {
-	struct list_head peers;
-	struct ath12k_dp_peer *dp_peer, *tmp;
 	struct ath12k_dp_hw *dp_hw = &ah->dp_hw;
+	struct ath12k_dp_peer *dp_peer;
+	struct hlist_head free_list;
+	struct hlist_node *tmp;
+	int bkt;
 
 	lockdep_assert_wiphy(ah->hw->wiphy);
 
-	INIT_LIST_HEAD(&peers);
+	INIT_HLIST_HEAD(&free_list);
 
 	spin_lock_bh(&dp_hw->peer_lock);
-	list_for_each_entry_safe(dp_peer, tmp, &dp_hw->dp_peers_list, list) {
+	hash_for_each_safe(dp_hw->peer_hash, bkt, tmp, dp_peer, hash_node) {
+		ath12k_dp_peer_hash_table_delete(dp_hw, dp_peer);
+
 		if (dp_peer->is_mlo) {
 			if (dp_peer->peer_id != ATH12K_MLO_PEER_ID_PENDING)
 				rcu_assign_pointer(dp_hw->dp_peers[dp_peer->peer_id],
@@ -1294,17 +1298,15 @@ void ath12k_mac_dp_peer_cleanup(struct ath12k_hw *ah)
 			ath12k_peer_ml_free(ah, ath12k_sta_to_ahsta(dp_peer->sta));
 		}
 
-		list_move(&dp_peer->list, &peers);
+		hlist_add_head(&dp_peer->hash_node, &free_list);
 	}
 
 	spin_unlock_bh(&dp_hw->peer_lock);
 
 	synchronize_rcu();
 
-	list_for_each_entry_safe(dp_peer, tmp, &peers, list) {
-		list_del(&dp_peer->list);
+	hlist_for_each_entry_safe(dp_peer, tmp, &free_list, hash_node)
 		kfree(dp_peer);
-	}
 }
 
 static int ath12k_mac_vdev_setup_sync(struct ath12k *ar)
@@ -15530,7 +15532,7 @@ static struct ath12k_hw *ath12k_mac_hw_allocate(struct ath12k_hw_group *ag,
 
 	spin_lock_init(&ah->survey_lock);
 	spin_lock_init(&ah->dp_hw.peer_lock);
-	INIT_LIST_HEAD(&ah->dp_hw.dp_peers_list);
+	hash_init(ah->dp_hw.peer_hash);
 
 	for (i = 0; i < num_pdev_map; i++) {
 		ab = pdev_map[i].ab;
diff --git a/drivers/net/wireless/ath/ath12k/wifi7/hw.c b/drivers/net/wireless/ath/ath12k/wifi7/hw.c
index 48a2f6da16ef..9f2b1dddfdb4 100644
--- a/drivers/net/wireless/ath/ath12k/wifi7/hw.c
+++ b/drivers/net/wireless/ath/ath12k/wifi7/hw.c
@@ -488,7 +488,7 @@ static const struct ath12k_hw_params ath12k_wifi7_hw_params[] = {
 
 		.dp_primary_link_only = true,
 		.client = {
-			.max_client_single = 512,
+			.max_client_single = ATH12K_MAX_CLIENTS,
 			.max_client_dbs = 128,
 			.max_client_dbs_sbs = 128,
 		},
@@ -587,7 +587,7 @@ static const struct ath12k_hw_params ath12k_wifi7_hw_params[] = {
 
 		.dp_primary_link_only = false,
 		.client = {
-			.max_client_single = 512,
+			.max_client_single = ATH12K_MAX_CLIENTS,
 			.max_client_dbs = 128,
 			.max_client_dbs_sbs = 128,
 		},
@@ -682,7 +682,7 @@ static const struct ath12k_hw_params ath12k_wifi7_hw_params[] = {
 
 		.dp_primary_link_only = true,
 		.client = {
-			.max_client_single = 512,
+			.max_client_single = ATH12K_MAX_CLIENTS,
 			.max_client_dbs = 128,
 			.max_client_dbs_sbs = 128,
 		},
@@ -871,7 +871,7 @@ static const struct ath12k_hw_params ath12k_wifi7_hw_params[] = {
 
 		.dp_primary_link_only = false,
 		.client = {
-			.max_client_single = 512,
+			.max_client_single = ATH12K_MAX_CLIENTS,
 			.max_client_dbs = 128,
 			.max_client_dbs_sbs = 128,
 		},
@@ -963,7 +963,7 @@ static const struct ath12k_hw_params ath12k_wifi7_hw_params[] = {
 
 		.dp_primary_link_only = true,
 		.client = {
-			.max_client_single = 512,
+			.max_client_single = ATH12K_MAX_CLIENTS,
 			.max_client_dbs = 128,
 			.max_client_dbs_sbs = 128,
 		},

base-commit: 03b7c601b6e314115015a57061f5b377afe13190
-- 
2.34.1


