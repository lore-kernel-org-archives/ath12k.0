Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E31D3606A330
	for <ath12k@archiver.kernel.org>; Wed, 11 Nov 2026 16:22:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=h+/cZvPF;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=XTt915OF;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=faL1eT6v
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=pvn0sQHTZMzorBQux6BXwkwGi8BOFiSRo4wms43N6Ck=; b=h+/cZvPFeAof67ypQ78/ck1/wq
	XK6POgmWtPPbm+cUuGwOw0ktgStNOWaH51p1juYrCum6xe8XN1+0amui5+jAq7xT4uZ8daWDzcL2z
	RCM4kgaj5M6++DT3hSfzGes0wFiTL8uUydEiRI++rmF9eanINhk3SNaqnD3NLEGfwFy958qml2tPR
	cpQ0P3BG1eVRiK0s6LZ4Tvinj2DuQN+POjTDdaU/LFdAc+xQTVhcgRjK0m45BxsF60w1YwZKx4ucK
	Fnz8npQvfwhVyDSJzWA/vg8XUIzzWZjFjA+6WfphsP5M8NV8H8nKK/atp4GNLrsPhkwza263Vdkvv
	2Vq9qcAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRB5S-00000007AqM-48bk;
	Wed, 11 Nov 2026 16:22:14 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRB5P-00000007Aot-0zFK
	for ath12k@lists.infradead.org;
	Wed, 11 Nov 2026 16:22:13 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ABFSoUJ1074401
	for <ath12k@lists.infradead.org>; Wed, 11 Nov 2026 16:22:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=pvn0sQHTZMzorBQux6BXwk
	wGi8BOFiSRo4wms43N6Ck=; b=XTt915OFCvv33oS41yWUKe766/VwsJA7fwCECH
	j9FyYnhpKYLcwmVHouFKLEFB54EUzaW4Pw5+FOkRI5nwUgWOBz1nFohIlfLTo9XF
	X+9tnRBbL4xrU39h0Ul5sbe5IpH7aw/JpFAYhxb2Q+W5ifnyhhjhyBTZvwn+MJ7y
	w762Gi5IIweAAnE5831IHayWKhSMDuhuH+Xkf91A2sxMPFUmFayoT6NNmkdizT6N
	myQAEOrAfoMsI5+7M03aWbHq/QSO+HIlw7vJtkeULqHhgWjgeMnCbaZlgBgPnAJC
	slvk84uUBRvGbNACU0ZQM2c3rvLhYWl2+He/1viCGiGZbbLw==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hv9b34dqe-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Wed, 11 Nov 2026 16:22:10 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-341eff9e381so6708055eec.1
        for <ath12k@lists.infradead.org>; Wed, 11 Nov 2026 08:22:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794414130; x=1795018930; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=pvn0sQHTZMzorBQux6BXwkwGi8BOFiSRo4wms43N6Ck=;
        b=faL1eT6vEehasS2rOL60fPyFv67cNEUizWSqSAxLOoX32gBYXRy2qC+0oAg+vPGTEX
         LmIamWA1VXuxxhjpIPynzhJ1XWJEpfH9e4HeKUnQ7YCu7HLj+5vuCjYX5kp4ULmsQ1C1
         tGbhDj+jNqutUR+F/rZQOERQHTIHnwkEP/00tctL4AlqfBsMLzVqRgy7a0M17aaK7Yl7
         uoYI3LhI9Z0giokVedP4XRkppSmC6ZkNHjZ9/+m0BkL+nLUmqmkj5nGCcoGycAYXYVKv
         oSgRSmGXyuI+zLdqdsmGpjP9N4uA+HLOLM7jbMqDK1Mz2wGv20Fni2xBxEqqERN/fTwr
         u3rQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794414130; x=1795018930;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=pvn0sQHTZMzorBQux6BXwkwGi8BOFiSRo4wms43N6Ck=;
        b=VB7PRNjzXuIiibalh3GmcmsmffubvlkHIEmzBUzPNQHf1vCttTgSr9bhaHAUAA4r6T
         N3dju/Szuv3Q0ulv7oQ1BMgb+EZrZVSqr8Tcv0FXoXzyUW33cKsXBfFvQe78bG0F1E1L
         hzDGRAiWa10zmH7kri0c42E578SUQ1O4QHb5nCTUpt5iDeciK1Lx6xqMtwmoiBOI80Az
         tU8p+GElkQQUFx4Sz1pZy1dud68fOLeoXzw9v9OVhfj80cPOoQ/7BDXnOug0a0WqLkbv
         nf36oe7NHbl5L0Y/6Y1f1ypOfo4+8ULLeKndxPPYj3CT/JWFwQUXhQ2dOV3yLkYPjMDL
         B8xA==
X-Forwarded-Encrypted: i=1; AL+hErH3mIUnw+uLWIa39sIU1SOyR2vvH+4UriZJ8/8ci1rWJgGIy2E24raW0pgHwYh7jEc9OK7LEGk=@lists.infradead.org
X-Gm-Message-State: APuU4Z8i7E/AMa6uYYY/8vKpeKDkamREc4dQ/KK/TGWpg9C4EI1Rv9xG
	sy2pOvneY6IR4E1RprO0HeL/WJfT3dLTjOGjmWuw/VzrUb33RxW99Fmtw8XmphLnDxzhn82tojM
	j27Imq2gWIcNQTMFJqA/Nq8BusV+GswUEVcRNtYZoK2KraKD6FJMMqbIyn1nIC/7d6pdISZ9u
X-Gm-Gg: AYBFou3uJ6H6qs74IeMTFQx5ZooYsyrUUE5es7P9ZCjOKcmRRBaHaP5ShrlkZGByZNp
	oqWYUEHJ80lNAfOrw99jlrcZKlDPuSN6JHjgfLFuuajmvpQf+lAVaq8GXbrKzhdjw4NS4mibpdJ
	xD+TLp3xm51vrjc8Pxc7473LumyMHq49GS/EW8Rr6wom+coLMq4yHE07ir3KqM3NF31+EuAbdQ/
	NB/YBx4nZ9zfQJ2qUSL7Lc91dIbcreINkLfbNIG71E22HE/yKnW9H7SUxebWme/rwUEENwmETfU
	Jv94LP1Xd9A4scuxirWsjZ+bxKgOnZYEtpfmMXWkjHIb5UUEWqB+8sFWYUJPbQWDlhGAj/YlDQc
	DSdh8mmDRUMuXqXob10BrrOJ8xv+mzSOPr9e//Ff6pYA3B4k2vDLW5gYlFJ/curtXKDDsPTBLYT
	z18LhcMb75dyip61SGjePCbRy8MqU=
X-Received: by 2002:a05:7022:ea4a:b0:1a3:9936:d11e with SMTP id a92af1059eb24-1b3c034aff7mr2676019c88.41.1794414129443;
        Wed, 11 Nov 2026 08:22:09 -0800 (PST)
X-Received: by 2002:a05:7022:ea4a:b0:1a3:9936:d11e with SMTP id a92af1059eb24-1b3c034aff7mr2675992c88.41.1794414128488;
        Wed, 11 Nov 2026 08:22:08 -0800 (PST)
Received: from hu-jjohnson-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b3b5b2eeffsm17802931c88.9.2026.11.11.08.22.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 08:22:07 -0800 (PST)
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Date: Wed, 11 Nov 2026 08:22:06 -0800
Subject: [PATCH ath-next] wifi: ath12k: use str_enable_disable() in mac.c
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261111-ath12k-coccicheck-mac-v1-1-6d8ac143ef05@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAC2W9GoC/4WOwQ6CMBBEf4Xs2SVtUVI9+R+GQ1mKrQjVthAM4
 d8t+AFeJpnMvtlZIGhvdYBLtoDXkw3WDcnwQwZk1HDXaJvkQTBRcs4Zqmi46JAckSWjqcNeEdY
 nJc+saWVJR0jsy+vWznvvDRKCg54jVL8kjPVDU9xqt1tjQ3T+s0+Y+E78+TZx5CiLljVFXQgh6
 epCyN+jepLr+zwJVOu6fgEtvc9Z3QAAAA==
X-Change-ID: 20261110-ath12k-coccicheck-mac-b5a890df86c4
To: Jeff Johnson <jjohnson@kernel.org>
Cc: linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        kernel test robot <lkp@intel.com>,
        Julia Lawall <julia.lawall@inria.fr>,
        Jeff Johnson <jeff.johnson@oss.qualcomm.com>
X-Mailer: b4 0.16.0
X-Authority-Analysis: v=2.4 cv=GKGdgeNK c=1 sm=1 tr=0 ts=6af49632 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=VwQbUJbxAAAA:8 a=QyXUC8HyAAAA:8 a=EUspDBNiAAAA:8 a=Br0jzTNd2fROkmabWI8A:9
 a=QEXdDO2ut3YA:10 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTExMDA2NSBTYWx0ZWRfX7sP60kB9BrcS
 zlyxZnUSkx8CHVjGSQdBv2OHlIkH5x/IRD7kR+rvgw5+HsY9gW/KVbzy2DSl4bTlJj3k0PG6mAR
 9m8pfmXEfiZMvm9r8s0KkEJog5Usu3hRyg26qkPugKJjWltAhfwSIt+tTHnk6HOo0JualqmiDJM
 ii/3M11p+EgdzyBrvq7bg7vTNev4JOrVdPb8NCxCo/sjYO9ncDst5a8Rrh/+hgeavTmc1mHxKpp
 ZOPENxo9CflWVvQYXYp6Y8w5Unx9Zr58YJRYbu7JCvAyAZsKOfsgfHfJUTwergX7nCXVWQBltKH
 6jVaaSvH2UsXSJb/wGCVfDWJ+PhMiD/wSlH2hYQShyy6cAGYvrqZ12Zg0Dz38CIhRuCjtl++c5B
 4LXdrH+dccbAp4vW1DgPgwsFxXFUYwuru8GjC2nHhP1ng/I99LyGveYkOIzcyTfjvKnUyOzwQA6
 cbXo5dsbLy0/HfJI79A==
X-Proofpoint-GUID: Ihf7yDLiGSMsSzO6d9Z5T-6ytIrETbFx
X-Proofpoint-ORIG-GUID: Ihf7yDLiGSMsSzO6d9Z5T-6ytIrETbFx
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTExMDA2NSBTYWx0ZWRfX7o9GSaoTgRlS
 ZUXQ3aNnz3tTgzxOKvn3nag0bFxNvgrmU0kMBJEySHdbZPORxEF+CJpKyZIgspuFIXqOHiPz67A
 oPValv6kUQb5mwMf1DNCd+dh+I9kdMI=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-11_04,2026-11-11_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 lowpriorityscore=0 priorityscore=1501 phishscore=0
 spamscore=0 bulkscore=0 suspectscore=0 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611110065
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261111_082211_287152_977A09B9 
X-CRM114-Status: GOOD (  10.87  )
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

"make coccicheck M=drivers/net/wireless/ath/ath12k" reports:

./mac.c:4556:21-27: opportunity for str_enable_disable(psmode)

Update ath12k_mac_vif_setup_ps() to use the str_enable_disable() helper.

Compile tested only.

Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Julia Lawall <julia.lawall@inria.fr>
Closes: https://lore.kernel.org/r/202411011943.yYxnp7QA-lkp@intel.com/
Signed-off-by: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
---
 drivers/net/wireless/ath/ath12k/mac.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath12k/mac.c b/drivers/net/wireless/ath/ath12k/mac.c
index 4f16c78b52a8..b37ec64cb639 100644
--- a/drivers/net/wireless/ath/ath12k/mac.c
+++ b/drivers/net/wireless/ath/ath12k/mac.c
@@ -7,6 +7,7 @@
 #include <net/mac80211.h>
 #include <net/cfg80211.h>
 #include <linux/etherdevice.h>
+#include <linux/string_choices.h>
 
 #include "mac.h"
 #include "core.h"
@@ -4553,7 +4554,7 @@ static void ath12k_mac_vif_setup_ps(struct ath12k_link_vif *arvif)
 	}
 
 	ath12k_dbg(ar->ab, ATH12K_DBG_MAC, "mac vdev %d psmode %s\n",
-		   arvif->vdev_id, psmode ? "enable" : "disable");
+		   arvif->vdev_id, str_enable_disable(psmode));
 
 	ret = ath12k_wmi_pdev_set_ps_mode(ar, arvif->vdev_id, psmode);
 	if (ret)

---
base-commit: e3485cc885b81314c814a43db2255b1f9100928f
change-id: 20261110-ath12k-coccicheck-mac-b5a890df86c4


