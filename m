Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 480EBC53219
	for <ath12k@archiver.kernel.org>; Wed, 29 Jul 2026 07:18:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2vV6PuhWyYC3Y53legCPkn4+Y6Rrzb6+xFpOeHasTnE=; b=NqXzhXBbRMbu5zfz/HaNStKS0A
	wdtKVaTr2B6Ry4ZLxJEa94sw4IR1XXnQJnTIB/d/R4mIl7k05xeKlVLPBsQXuecaewriUAovFtwvv
	HehGhtj4QTUUj1HZyw2H0K59UeFJXMrm3JYlZUXf6u5X7h4Ig1FXiwKvRxiiCTNhf0JxvNE5dpgbQ
	DrhTMpY8j9vUrD8NJ6f7Qv6hIOs1g9PPSwnFs+CjrYVzgalZJLFhGVI6bRGvkbFnj28bUOLKSnyxF
	Y3riJp/yUlmHCDsJ8HPQ/H1eKXIJiDAwavbXmeiNyk/ti4XlxX+0edCyOfhHB9c1Q/VfVZOs5ei0O
	5EV5OGgA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woyYz-000000076Cd-08MQ;
	Wed, 29 Jul 2026 07:18:49 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woyYs-0000000769C-3oHn
	for ath12k@lists.infradead.org;
	Wed, 29 Jul 2026 07:18:45 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66T5iREj1123060
	for <ath12k@lists.infradead.org>; Wed, 29 Jul 2026 07:18:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	2vV6PuhWyYC3Y53legCPkn4+Y6Rrzb6+xFpOeHasTnE=; b=LyeJN2UMjXJcIwvz
	0GdDcXSc9aIVC4jIP0MHJWyirG1Af9iJXBlyhDpCiIbSt+R4WbishLtuxIdE2REr
	q4ce3bDvyNJ4afR+RghuRsNyrjJ4V6vknX4I2BsPoWudJR+47LAFcr6odjeWCStg
	asVa3lBDPRrXgOtNp9cHB76ZYAL22qehAoNMp8WGUqysbacbqXDlcOKIAvAmniE2
	sK18qyP5MZkP+Y3kZLk3UVlijWGnzLCg19rwZcPaLEqAC7qZv+jk/deuYAjXMxyy
	t3fdDAcC9vL7IGbLkUSLAW4VCcQXhfQK/IJqA++LxJ041/ElQDZybajRF7X7dLlz
	FIlH1Q==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fqbmxrbh2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Wed, 29 Jul 2026 07:18:41 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-cb11535e6a1so516429a12.0
        for <ath12k@lists.infradead.org>; Wed, 29 Jul 2026 00:18:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785309521; x=1785914321; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2vV6PuhWyYC3Y53legCPkn4+Y6Rrzb6+xFpOeHasTnE=;
        b=RQV3NbnFdEs4GPVH7zWQr3ETzi9SLMUeTGRqdyAqnNKR/dznfqzsQhB25KQxPnPj3N
         j2cbwmTnlk6a4hTo33eL80yvzKSDVuqk8+B/Yfq1oboHBi07+JrP4snJMJIrRPvonOel
         QvfPEQOukE1wzy/Vd1Q7vH10b5hC2QzERpGo+HgN16staczT5nJrfEz8Sgb9eQaJzrdM
         Hk9X4OkG3MZ9nPtwUAZvvwvx3xQBrRt9akYnPq5LczNceORukmjLkH4snkbGBwWfs4ru
         0ajm2c6ObAok92Dwvpy6a0beP3urxxSi3HOfF7N8tJKgUrhzvKz99C563H3FCcRxsj2Y
         pjqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785309521; x=1785914321;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2vV6PuhWyYC3Y53legCPkn4+Y6Rrzb6+xFpOeHasTnE=;
        b=Id+IfOFy6TzB6KzmXj0sK7BLCLRvwifduHUudzGJ2eEfoxVjLvM6R3IoBdD7dJdsY9
         lBawdmqqzFLFWrw3y1ybLIZDkgyF+2oOaBHWFjr8xU4aW7IgWZ/hFfdxNFbIzbC2G46g
         qO2svI42E5GqsCVQHK6wn1cXpeZ6QFTa68Q4A7YwdhD8c9+ecXgqUvKYSFnyRyDc1boB
         e9/D3ELI5jDm5ffJeAPbcb/6rkK8OZ4IsCOZI/XttODZyIzzQIH5u3Fvrs3ksuLf7K08
         UJNmfEaGNK1AttK3dQakfeX1Q8/82KRyvWQn5Uwxjr/IMD68UWmVIQqA+7nvpeptQIO+
         BGtg==
X-Forwarded-Encrypted: i=1; AHgh+Rr8bSV9oadN8L+0olkobKY4c35QcmZXOzgZSDvlCSa6osj8s+7x6ao8jpE1FDTAi8lKOdZI8qA=@lists.infradead.org
X-Gm-Message-State: AOJu0Yz5GBylO07Tmf5lHbMngjod3D+iYKyyY0mbWnKNo3ClPi/ReSe7
	40nvrkWmx6JQBPO5V3QmnHoCF+najMOunMYZnoZgn6vXBjEOQThwjBkg5eC3yGzw5yelbNGhb3b
	ZygY22J75JO+PtQ+8OAF6qoKWSpGUTfWpd6OwKwdS+XXRoxOPXK7/BftAwhfwkY9r
X-Gm-Gg: AR+sD134ylCPKp521iqAcQQEeQOX/cFBs6NAXAcLnUqPf8N7G8hKeAB57F6jLZHfk0f
	lZOlcxfd10acAA6xezE4+0dFvG9mIV8qJLH55rnIpHsuc9ChOvaRhja4JH2JpslPwaR+bGAJCX7
	TzIY16ylae1azp7qnKP52yjiS1A3ILuHpjdmdz5EBe6spuhqRRuZPMU/0IDU27aGqkylEQqiEBX
	ksLMaiwAaALHe1kE88OVZSuc8adQta7TdJ2vtWwrIwew8To0VQ/wyhMXSIoCKRun4Fg2P17jO3V
	eO+V5OCepEqTgjAgQJl2mQK739aQB1Lnf8qlNEDlY6Hb+MR6OEKTZC1T7MmJuPNvIaqQGMhuJ7C
	DITzQ9Qr9KMmwCGi0lU7mxesgfz6VTG/pp2nwSED2hfbvTYu+/pXEHA==
X-Received: by 2002:a05:6a20:7291:b0:3c3:a140:939e with SMTP id adf61e73a8af0-3c8ba5f59a7mr5905268637.53.1785309520901;
        Wed, 29 Jul 2026 00:18:40 -0700 (PDT)
X-Received: by 2002:a05:6a20:7291:b0:3c3:a140:939e with SMTP id adf61e73a8af0-3c8ba5f59a7mr5905248637.53.1785309520439;
        Wed, 29 Jul 2026 00:18:40 -0700 (PDT)
Received: from [127.0.1.1] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cbdb78ae98asm474793a12.1.2026.07.29.00.18.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Jul 2026 00:18:40 -0700 (PDT)
From: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Date: Wed, 29 Jul 2026 15:18:14 +0800
Subject: [PATCH ath-next 4/4] wifi: ath12k: skip setting country code
 during registration when unchanged
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260729-ath12k-regd-wait-timeout-v1-4-504aa6e7e93c@oss.qualcomm.com>
References: <20260729-ath12k-regd-wait-timeout-v1-0-504aa6e7e93c@oss.qualcomm.com>
In-Reply-To: <20260729-ath12k-regd-wait-timeout-v1-0-504aa6e7e93c@oss.qualcomm.com>
To: Jeff Johnson <jjohnson@kernel.org>
Cc: linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        Baochen Qiang <baochen.qiang@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI5MDA1OCBTYWx0ZWRfX7HzI3CDTcvst
 gQDldL2AbxarChz8nPa+yhAeGuJjOAPEW3JpDlFyc0B27rFgF9i2SH/0BqBd8I2U5jsO3+oBywk
 KFRL1tk0JYw17bv2SE5KTfxuvVZ0tB7VBGZwsyjAJiJck2TzYaO1RrQKr35FLZi7GvNTqvAHHsn
 lAOJH9gj3FgJBWvnAlnRVxPQS3HSJRyup3fDtw2Cg+1QghAJs6p5fI0Z/hfsG4bXoCdl5CiMpwX
 l2UPZYwbBQueZKiVyUrngclNNeon4FFF6M1xyQNkQHDgalHoD3h2vc8gPR6jmrYjjO8P8yp33ZS
 2DkO2HB4lkG/Vk1m9W34kKuqqDfIeJKEyLUtsu+jS2Du467nS/AkrE0HwKTLMKuD4CefxOqoj3+
 +TtPPK+X2xq+r2uomrKMQfJ6/Dpjrya47sBdC3sDsc8HZZ8LWC14TlBsStjhe0k3z//kVUOLU4A
 MQEbBz+8VRhdY4Q1Qbw==
X-Proofpoint-ORIG-GUID: lUoLVUqgYhGES-ulMmjpBy_6svv_o0hY
X-Proofpoint-GUID: lUoLVUqgYhGES-ulMmjpBy_6svv_o0hY
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI5MDA1OCBTYWx0ZWRfX5x5ht+3Mz2LH
 lveBJSDHXuLcsDNu3uv/YUSSUDj6NI3Lzm88aEuJinEOTObZHRQO9HBUqY+HOC+25fADZfwmfTa
 4mXVhygEylmwKZOb0DLmqn4tOxkAjZ8=
X-Authority-Analysis: v=2.4 cv=fLIJG5ae c=1 sm=1 tr=0 ts=6a69a951 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=Z5rCUsNQUV31c42Ogt4A:9 a=QEXdDO2ut3YA:10
 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-29_02,2026-07-28_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 malwarescore=0 phishscore=0 suspectscore=0
 clxscore=1015 spamscore=0 impostorscore=0 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607290058
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260729_001843_620552_258A32DC 
X-CRM114-Status: GOOD (  13.00  )
X-BeenThere: ath12k@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <ath12k.lists.infradead.org>
List-Unsubscribe: <https://lists.infradead.org/mailman/options/ath12k>,
 <mailto:ath12k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath12k/>
List-Post: <mailto:ath12k@lists.infradead.org>
List-Help: <mailto:ath12k-request@lists.infradead.org?subject=help>
List-Subscribe: <https://lists.infradead.org/mailman/listinfo/ath12k>,
 <mailto:ath12k-request@lists.infradead.org?subject=subscribe>
Sender: "ath12k" <ath12k-bounces@lists.infradead.org>
Errors-To: ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org

Currently ath12k_mac_hw_register() unconditionally sets ab->new_alpha2 to
firmware. But when ab->new_alpha2 is the same as the country already
applied at boot time (stored in ab->default_regd), setting it again is
meaningless. So skip it in that case.

Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.1.c7-00108-QCAHMTSWPL_V1.0_V2.0_SILICONZ_UPSTREAM-3

Signed-off-by: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
---
 drivers/net/wireless/ath/ath12k/mac.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/drivers/net/wireless/ath/ath12k/mac.c b/drivers/net/wireless/ath/ath12k/mac.c
index 56f9c1945cf0..91182e826bb8 100644
--- a/drivers/net/wireless/ath/ath12k/mac.c
+++ b/drivers/net/wireless/ath/ath12k/mac.c
@@ -15054,6 +15054,8 @@ static int ath12k_mac_hw_register(struct ath12k_hw *ah)
 
 		if (this_ab->hw_params->current_cc_support) {
 			struct wmi_set_current_country_arg current_cc = {};
+			struct ieee80211_regdomain *default_regd;
+			bool same_cc = false;
 
 			spin_lock_bh(&this_ab->base_lock);
 			memcpy(&current_cc.alpha2, this_ab->new_alpha2, 2);
@@ -15064,6 +15066,16 @@ static int ath12k_mac_hw_register(struct ath12k_hw *ah)
 
 			memcpy(&ar->alpha2, current_cc.alpha2, 2);
 
+			spin_lock_bh(&this_ab->base_lock);
+			default_regd = this_ab->default_regd[ar->pdev_idx];
+			if (default_regd)
+				same_cc = !memcmp(default_regd->alpha2,
+						  current_cc.alpha2, 2);
+			spin_unlock_bh(&this_ab->base_lock);
+
+			if (same_cc)
+				goto fw_stats_init;
+
 			reinit_completion(&ar->regd_update_completed);
 
 			ret = ath12k_wmi_send_set_current_country_cmd(ar, &current_cc);

-- 
2.25.1


