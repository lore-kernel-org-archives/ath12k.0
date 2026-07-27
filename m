Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96701C531D0
	for <ath12k@archiver.kernel.org>; Mon, 27 Jul 2026 15:29:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:From:Subject:Cc:To:MIME-Version:Date:Message-ID:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=aCP7o02Y8I/xfGf3dGEk8zMltx8sX5iT2Za0pUwKugE=; b=14CCHEnnOmeiJzi3MfnVAkNUbG
	HsqSVgPEqQpUNKr3t9wc4MeRveJG3TzBgfbwVYTJAW35OoBafvvUua5/AUSRZYrGRF0YBFyTACj2E
	k5LHaRjSgCucyCTzX+7+SHKEdQqL1ZgCG0nQbGVtbAEL39THqaP2MK2kRZV07ViNoQRbTG8Rqd8ZE
	Lc2VicyU44e7rdlQPozkxpFw/raAkmEkcc9OWzVs7cjrjn1QiLVb7e5Xo/ZWs91Qap9+K1TnZ4ODt
	t0LY4NFKmA2qVwMOvEu9ZyrqDQto22rMq4KbYBqH8dU7uWeD3AyMOSbVWYX/8tyr6uYomX0Jjz17v
	5mVRwigA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woNHB-00000003B2B-1A68;
	Mon, 27 Jul 2026 15:29:57 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woNH7-00000003B1E-3zoZ
	for ath12k@lists.infradead.org;
	Mon, 27 Jul 2026 15:29:55 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66RDldnc3414105
	for <ath12k@lists.infradead.org>; Mon, 27 Jul 2026 15:29:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=aCP7o02Y8I/xfGf3dGEk8z
	Mltx8sX5iT2Za0pUwKugE=; b=WYfoJWar3ooaV9cJywWtCXVn47vd44paedwCcT
	s3PiFVlFCpPityAaUTQ/e4GZHmZ66B5v41gNSlZ3imoFoTgmwRdOiRc182jW1NjK
	EDi1dgrZr/dttr4Pq1sbSbwqmr1ZNs7iE8nq046bn2Z8XTUByy6NOXA7lgG+0sRP
	R1r7zm0s06pcSlTo0T9+oAIpqfUQ6RWSI40UFkCyYk7XU3fWF4WOWKrCSboNz/eD
	TGLi7FOkYtFIjFOKHsWecvlBeAWdIS3rMuF51+cK67GOJhk0+CAA/+XnrSuPXgHx
	iUGo4mhjoW4dqgZsx38CVwtuo27ufLihgcR2if8EP6Zqifhg==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fp4v69ea8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Mon, 27 Jul 2026 15:29:53 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-38e25e4b41cso3390432a91.0
        for <ath12k@lists.infradead.org>; Mon, 27 Jul 2026 08:29:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785166193; x=1785770993; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:from:content-language
         :subject:cc:to:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=aCP7o02Y8I/xfGf3dGEk8zMltx8sX5iT2Za0pUwKugE=;
        b=cGsf2DMwloU2kjBmKKEks/9zifBZnckFdznIRzi6YFwBXW9EP5fTS0uBv4Ly9kInkA
         +udS2VZuZuTVTZunGRDLohPsA5/uiMUpl+cVzvwstkW4MM/wePuExBoXocYOgNQDJvKJ
         b0K++AGkW+DfarRXmQMFLrI8CgpHEHbRzeoAO3AicHpcoDRKsd2xYsBV8FlUVrTXYc6/
         CK+z9y61Bt38ndE9hRqYVnSJOilYyrOYJt+qeSNShj4QIeJx44z7J89XSJaSpITd5BYY
         GamFBW+YcMrkEHFxyxrfy8msa3oRmsdY4qmZW+v6JaQ6B6AkOa8ivm46ufXQsZyPixK6
         1dxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785166193; x=1785770993;
        h=content-transfer-encoding:content-type:from:content-language
         :subject:cc:to:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=aCP7o02Y8I/xfGf3dGEk8zMltx8sX5iT2Za0pUwKugE=;
        b=koVZaYw/yjECKGOGKPxOjzacuvcXi0g1dXjRHxB0YXpwubGXWcrO2zNj4vrYr5R+cO
         BXy4mCFx4NNoSJlNGOjLDDYjRBGJInkLFQ7BW/s085qOUjSZ+Alk79AWSZhSAzrad4hp
         0rOaF19G6mdfPiP1mqqCmC6DBPqQa5JrhawjA3WE4d2fAyZlC6gSUujrsCFZicqUsy4+
         jJc5Fj0Tuxgxc3rdBDK2Oe88wPoKurF8xUfE1fbSQKhihmQUd4wkOvxQ85k4nVaM9hJq
         cW+cYK4EHCFsmNJvTKyV8T0loqRoPSOuiyBDlKHYOXLNY108Jnsz2FTN6Fu/Ok5E7jLQ
         S57g==
X-Forwarded-Encrypted: i=1; AHgh+RoIoZnpy8PlcRx3QfrXqJEEKF8AtOC/7d5dnYmLRcS1kOueWp6bVF389ybt3PHXQK+45jilkYU=@lists.infradead.org
X-Gm-Message-State: AOJu0YyNzifwy3rlHsMR39mVSU4I1XnUkX4x867Fwp99Ln6t8K1Sg4gQ
	ObBBzEQ1Yv3sQ3/hhVq2pFciJoelCr0A7JtxlXvLlrb8WC2ZVWDYgCBUDXud09g+QvGlRgGKUMd
	vn3juu5lNq6gWRTxLKUsrokXZhvOhyVFq7b+bfX2RtLE2nSRUymB5KbdeyycJRG3H
X-Gm-Gg: AR+sD10enQxPF+wNIQ7SdOHUCvXtISMGrH6oSVXK2aBOwtgWrMOUuOnM3k0a+FGtwqD
	8imHn3p7l6qhi+TMREJRMWulA0VY7kWs6P5i4LCnbYv0pzOwsDLJqACSBDIaQzLuUYO9qKcXAFT
	qmyfUmybe5vEUfZYWclu4tmyxbkOXYGS0qCDNXCfIfAYS43kxAxzf/CqOUYrezF3sxyDCc0fBMG
	yl5wjPOCQqg4WXRuHuJS1wBN1FyacnoI9gumcmt+hds1KPsuEPoxMbhewvnuwOSMbsHLcnAyKO4
	AZ4Yq+uFo5SAG0MhMJ329zr+n5i0M6cdzevCHRoeCUoiHUFVlNNlLCGZehUSNUzgN/tp1t2zuKi
	iTL9oDntAAWLhCa9A8R8+HlfX2kEx5Vq/IUbb
X-Received: by 2002:a17:90b:4b86:b0:38e:a555:8fc3 with SMTP id 98e67ed59e1d1-38f2965654bmr8839879a91.41.1785166192560;
        Mon, 27 Jul 2026 08:29:52 -0700 (PDT)
X-Received: by 2002:a17:90b:4b86:b0:38e:a555:8fc3 with SMTP id 98e67ed59e1d1-38f2965654bmr8839848a91.41.1785166192076;
        Mon, 27 Jul 2026 08:29:52 -0700 (PDT)
Received: from [10.81.91.45] (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13d130f55c6sm88728062c88.15.2026.07.27.08.29.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Jul 2026 08:29:51 -0700 (PDT)
Message-ID: <8ea62ed4-0a27-47f3-ad4f-b30a1317c800@oss.qualcomm.com>
Date: Mon, 27 Jul 2026 08:29:50 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: linux-wireless@vger.kernel.org, Johannes Berg <johannes@sipsolutions.net>
Cc: ath10k@lists.infradead.org, ath11k@lists.infradead.org,
        ath12k@lists.infradead.org, jjohnson@kernel.org
Subject: pull-request: ath-current-20260727
Content-Language: en-US
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI3MDE0NSBTYWx0ZWRfX1aZ8XQO15f+1
 FLFbg+refZEmXfZ6q6bRxJMrKBcVHfgAB995iffms2xhvoPDIN+qwDeMCywfS8ahUHCdi+sCxXB
 KA2ceotIeaE2trmtlEcy8j8Zp4x6f/A=
X-Proofpoint-GUID: io_S7yyuD-hITKTS4d9t_Y-oAcrPn2kn
X-Authority-Analysis: v=2.4 cv=ev3vCIpX c=1 sm=1 tr=0 ts=6a677971 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=VwQbUJbxAAAA:8 a=LjZE-VvXoyxWvIaTNqcA:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-ORIG-GUID: io_S7yyuD-hITKTS4d9t_Y-oAcrPn2kn
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI3MDE0NSBTYWx0ZWRfX3K4G57hewwl+
 pY1xvaLzlFfreHy4TJbwqZF1+tDIbEs3d56tiGrvgEudfNDqNGOdMI3UQZhcIJBpPZAudHtsUD3
 v+30FtXCb3MXwDg9Lfhn6FVCiv0H30KzIhaM6JSN3JGN7Sj81xYFLjsb1N5hF8tQxbvHAasJz9d
 tOh5qlezL24M1FrHdyU5k5ZXwsT7TQ7zBcucb4iJVou+GfDgfIGMbigT7LGr3Ae/OEe89KuUOdo
 Txt2Rzp1UnNq+h3xwBucxQdgrsj2qa/jJu3brOODySEWlHX0PLWPM6h8wbGtMeG25FDZGtoppVS
 Fqf8bYEShnLTjRZN/HM5359feQlwNvbJ0cZ6fh4G9f4HdgJmXjbkAXlxRMTf1okJwJVaCBwYkwl
 aIgYHJN18na5W4SfTGOVL3QJt3iXmMkFShHrg1QYf+eUXo0GZjlvLzSOEJqx+s6ZX9FT5ixwUR8
 14BAxV0aefO5g+PILnQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-27_04,2026-07-24_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 phishscore=0 lowpriorityscore=0 priorityscore=1501
 suspectscore=0 clxscore=1015 impostorscore=0 bulkscore=0 malwarescore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607270145
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260727_082954_003791_91906D70 
X-CRM114-Status: UNSURE (   7.72  )
X-CRM114-Notice: Please train this message.
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

The following changes since commit b24adfed83ae3fe623d978a30d5c6c636a874821:

  wifi: cfg80211: guard optional PMSR nominal time (2026-07-21 14:12:24 +0200)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/ath/ath.git tags/ath-current-20260727

for you to fetch changes up to 469d7e6077c1665754eaf330e1feabdca7b060ae:

  wifi: ath12k: resolve PENDING ML peer ID from MLO_PEER_MAP HTT event (2026-07-27 08:00:43 -0700)

----------------------------------------------------------------
ath.git update for v7.2-rc6

Fix an ath12k MLO regression impacting WCN7850/QCC2072.

----------------------------------------------------------------
Baochen Qiang (8):
      wifi: ath12k: fix out-of-bounds clear_bit in ath12k_mac_dp_peer_cleanup()
      wifi: ath12k: factor out peer assoc send-and-wait into a helper
      wifi: ath12k: keep ATH12K_PEER_ML_ID_VALID set in ath12k_sta::ml_peer_id
      wifi: ath12k: add support for HTT_T2H_MSG_TYPE_MLO_RX_PEER_MAP
      wifi: ath12k: introduce host_alloc_ml_id hardware parameter
      wifi: ath12k: do not advertise MLD peer ID for firmware-allocate devices
      wifi: ath12k: defer dp_peer registration when firmware allocates MLD peer ID
      wifi: ath12k: resolve PENDING ML peer ID from MLO_PEER_MAP HTT event

 drivers/net/wireless/ath/ath12k/core.c     |   2 +
 drivers/net/wireless/ath/ath12k/core.h     |   3 +
 drivers/net/wireless/ath/ath12k/dp_htt.c   |  49 +++++++++
 drivers/net/wireless/ath/ath12k/dp_htt.h   |  12 +++
 drivers/net/wireless/ath/ath12k/dp_peer.c  |  75 +++++++++++--
 drivers/net/wireless/ath/ath12k/dp_peer.h  |   2 +
 drivers/net/wireless/ath/ath12k/hw.h       |   2 +
 drivers/net/wireless/ath/ath12k/mac.c      | 165 ++++++++++++++++++++---------
 drivers/net/wireless/ath/ath12k/peer.c     |  31 +++++-
 drivers/net/wireless/ath/ath12k/peer.h     |   1 +
 drivers/net/wireless/ath/ath12k/wifi7/hw.c |  12 +++
 11 files changed, 293 insertions(+), 61 deletions(-)

