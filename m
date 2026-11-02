Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BA18606BA79
	for <ath12k@archiver.kernel.org>; Mon,  2 Nov 2026 15:37:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=mMkNLpU6;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=casper.20170209 header.b=NFn20UEt;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=jjKN8T31;
	dkim=neutral header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=GTfn5vKN
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:From:Subject:Cc:To:MIME-Version:Date:Message-ID:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=oyfnNpy1b78sl00t26qycUkL8HD/T7BbVQF3a+A49i8=; b=mMkNLpU6LapldTxoZ7L1p73Lr+
	CFRezVOXkeoF5Gy0bHLeHt10uFXKy37S4HEzQxvsx9ZZE3Z157o6hP2oRJDNDYgUQpFhshemCAvdD
	cuqLSthmkrN8mOqFwjFrbnTDXmWT4K202zsalBVGQB2RDfL7WJlcmwE/NKOoIQlAxmPz6hd2QCt2K
	zprHGggrl8Ui5ean2wP9xyayLImLhWtYsD8HflK75a3K0/DQafKTmzo2QZP/SJF59C02/8VW5I6Xf
	epYxHjcFCM8WCUN+V0anoIz29KrXSsBb/EeRNv8RQ7LLxxx8Mg0Jas08ULmtKKukfhmAgeDs9iC0i
	UNDJt0VQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNu6d-0000000HAVY-3w2C;
	Mon, 02 Nov 2026 15:37:55 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNu6T-0000000HAJn-3iki
	for ath12k@bombadil.infradead.org;
	Mon, 02 Nov 2026 15:37:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:Content-Type:
	From:Subject:Cc:To:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=oyfnNpy1b78sl00t26qycUkL8HD/T7BbVQF3a+A49i8=; b=NFn20UEtEnOmaF4NHXu5SmtAg7
	JkP78J48QDCxRKXJRI128oE94HlNkOoeKeKY/1E0tRkPkUp+Bwf6B+83m1nY0Nvs7NtK+Vtk5JOSH
	2+JC0hV9OjKJNN1uF2fNo+ylKC8LV34VZMDAMDqC5qBO3Y/Goj9bAdfANf9wCub7I8ftyjWALvQnx
	HbvNWD2hoE/0cP3l6BdAblUZVWwhEgFb2OPvWDbOM25Z37k9kfBgrJpES06m+irUFMmFqAC0eykEb
	Srxmcy7fDGI0afhpN3VusC5ZpidilXirkLaCCodSH9XOTKy0SgaiX6rUspev1+gAlOiMszhVwIawY
	CKRSuRoQ==;
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by casper.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNu6Q-00000003ZcO-0xpF
	for ath12k@lists.infradead.org;
	Mon, 02 Nov 2026 15:37:44 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A2Dpl6v2449634
	for <ath12k@lists.infradead.org>; Mon, 2 Nov 2026 15:37:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=oyfnNpy1b78sl00t26qycU
	kL8HD/T7BbVQF3a+A49i8=; b=jjKN8T31v+jIiZZAXA8JZIFGeabOsy9Dd0Tkzo
	ntvNKWQkCMHHHbOUjti0duD98kwwbS6p7Gp+Mo4VNIGUa+g1LJjqYDdUT+PmS5+t
	4ixW8M1HIp9TFv8gOLuyRkndvnon3WR5suY1FsiNIx9UjdnAIUvZAblAnx+uY/8s
	URUYuCjBFU2lOtZZo/zsajPPkeIPbeQcW3GnnN9iQOjBTaQhMUVVa+OeG3SL2XVK
	l9FpLnDjEEl8DMtELI41liqUjeb5XYpweFbdpNrKJDVbDfEOzqOIS8PXWqojKJFb
	0TDqW1fuuitMPDsqwTfII4/xSM0yCwl/00MjUIoYyQVpjoJA==
Received: from mail-dl1-f72.google.com (mail-dl1-f72.google.com [74.125.82.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hpky4je9u-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Mon, 02 Nov 2026 15:37:37 +0000 (GMT)
Received: by mail-dl1-f72.google.com with SMTP id a92af1059eb24-1acbaf81bebso3892286c88.1
        for <ath12k@lists.infradead.org>; Mon, 02 Nov 2026 07:37:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793633857; x=1794238657; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:from:content-language
         :subject:cc:to:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=oyfnNpy1b78sl00t26qycUkL8HD/T7BbVQF3a+A49i8=;
        b=GTfn5vKN5CSerbpyjqiR/T56zG15AJoCYWshhSjcAaKoIFLlmtWoo6l8jmjiiBhC+q
         7Mda/RTKLS6PZI38ZisLbhSJS+I82OcJ/D6AQvPAVG77urQfPNwgAqsOI/tODvhr2v9F
         0UW/4Vy961UO9IL0edKuVC7k3KjlvxHo/v0xJC0Ehz0M/1D4xujAnKjzVct4z0/RT2o1
         y5tJjs22DxWtBzG6InZkJ2pTTJT4tSHDhPsfqcyqC9/hLjBRVIEZ9IhN3B4rHDCNVHNH
         viHz6zkRp7/3yIc4TNaIuoRf9FMdjaeNdCzUnbQdLsXXLu0DocUAZvSOj+CDYcHYN5Or
         wb2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793633857; x=1794238657;
        h=content-transfer-encoding:content-type:from:content-language
         :subject:cc:to:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=oyfnNpy1b78sl00t26qycUkL8HD/T7BbVQF3a+A49i8=;
        b=bmdp8yFF+bD+1rJ5TLZ7XjiJaYlckQuupChfe4iW5rBMXpDaT5Pe7H/zDHiRqxl1f4
         gxxn1izvZDpndM90qrXBgF181kKhHjgNIZsoxKs52/rDhH+AiCWWwp+wiECT8OuDRvxX
         QlK9U4w2qMjTZfoAl/nmSCafwI9o9al1KimWeMQcBSLcvG3wcpDbb/oJPGe7MbIRpvMi
         DJoeqq6U+q+aSVprw+Hu7KEgIc7kgv0julitI4OMJScCpj/eyBmuScFEzXCcMmatY7yq
         jIqpk+pAL8JPmVNt0HJ6apJyDAtq9vF0jOpVG2rBHwEz9u8aJjNlV+vWYte7bFNIZ65G
         65rA==
X-Forwarded-Encrypted: i=1; AKwUvBy4SHP76HsnJsLRD5O5A+HJM/vs9t09CimWxcQZPuEZQBlKZRE5EohID4RwDVp0mYnsKSbznLg=@lists.infradead.org
X-Gm-Message-State: AFq9FYI/uH5kCjq/XogQ/d2tIJ9aUtjOU93fBhsD8Q3uqZuATuKRYxYO
	dSrqHRvzdg0GZyIMlkHtGAo2e1/l517X2En4Iyi4jKe2QvlMv79nAQYedrnHqUIeRl7fRag9xwE
	PG7ciuUW6f57WdvtpQip89kt4UfDw1gCVP/AuacdFYneofCfQCy3U7e9DgUdBkn79
X-Gm-Gg: AYBFou2QfxU+FYzhTUwXfwqPupXF4Ou3lZikjAuXBh35GPY1dHkI8o0HANcjwq2pFZS
	mNa6uItow2m8F1UmoGMeN1WzFGmAEmDxyQX2ZdjsqmS+R0+ATJ51OKIIN6V539ERi08bLZXhowJ
	pcKdQ2r7ES0NFVb5H/L1BOd88XpC3DCz2/AtCN9DuJFLpNCEcVyY8TFJ2zXHnR7X5r17DaO+AgN
	+fHGTE7WGT4jNJCOsQ/dRd/VZJPrPYgeulM8cksOaw4JjsQTtz4RiWy4eGxRvTteuy8H9vc75uh
	6C/WsJG9Qe8sk2zZEI6VhQby6JF8t0eyjvyDyfbMf2k1aGaC5HiILeCMYWXsFDKJenqhXzfdwuv
	a7Q8Bx1Yj6qdc4e3gBekAIQeXCBoSEibsTtdh8wEDf5T9t/rnqPVA4gK9DNagYzcrmScUbYKBXx
	NNR0M7/Mk=
X-Received: by 2002:a05:7022:29b:b0:151:94a6:6f5f with SMTP id a92af1059eb24-1ac5c3699aamr15001756c88.10.1793633857039;
        Mon, 02 Nov 2026 07:37:37 -0800 (PST)
X-Received: by 2002:a05:7022:29b:b0:151:94a6:6f5f with SMTP id a92af1059eb24-1ac5c3699aamr15001712c88.10.1793633856334;
        Mon, 02 Nov 2026 07:37:36 -0800 (PST)
Received: from [10.81.91.45] (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1ac1b0a628bsm36987053c88.22.2026.11.02.07.37.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Nov 2026 07:37:35 -0800 (PST)
Message-ID: <8e38f8dc-88f9-4974-8f98-687795fb360a@oss.qualcomm.com>
Date: Mon, 2 Nov 2026 07:37:34 -0800
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: linux-wireless@vger.kernel.org, Johannes Berg <johannes@sipsolutions.net>
Cc: ath10k@lists.infradead.org, ath11k@lists.infradead.org,
        ath12k@lists.infradead.org, jjohnson@kernel.org
Subject: pull-request: ath-current-20261102
Content-Language: en-US
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: ieoYKQBE5oxuyCYQB31qEjvVGr0Ic55Q
X-Proofpoint-GUID: ieoYKQBE5oxuyCYQB31qEjvVGr0Ic55Q
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAyMDA2MiBTYWx0ZWRfXwMqajUdzx6Jz
 X+dr2E5Z44/E9Bplq2hem79l1H5bt9srS8GJBBitucoz37hlmhw7bwvpsztlNBx3Z8A0l/2CBQQ
 JyJjTxXKv5QRA03W44WD7GDg84EpScE=
X-Authority-Analysis: v=2.4 cv=QoHLTlyd c=1 sm=1 tr=0 ts=6ae8ae42 cx=c_pps
 a=bS7HVuBVfinNPG3f6cIo3Q==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=VwQbUJbxAAAA:8 a=qsoVpiIQ6ULyzOpuFuoA:9 a=QEXdDO2ut3YA:10
 a=vBUdepa8ALXHeOFLBtFW:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAyMDA2MiBTYWx0ZWRfX53MGR6ooAjIq
 eA5L9byx3aDhIsfQG4DposvHV8Gq9WkV6baUJiocMql9oR5GK0Uv/ci0NOy1c0q0vSTPvsejYbp
 BM8um/TxTHfgqlfEx0IOvHmsAs8UD9f7Ze59EDbteLrxlCX93X8JR+emrrGgWjleDWeYUT/N7yP
 2vUoEIWKB4S249Z8kkknQZLKfrKuOHuELx7h2umUGUVtCnV2PbZVSNf9SaU3MeVdDPJC0QVaZhX
 4a7mJJ8FxXRy0YnRjYMpfeNBAtw3jgd0dtkhlvm/LFn7ztQ2ZKLOUkLTSJ++s7P8R624+RvPTQY
 5uc/jkOC2bKZgPDGGDdyOvvoaJgWfaj3GBIhuu02KUV3+oi2cotGIi82ra/FX5nbtDsl3N7BIYl
 pbSWUXjc+r9PNwT9bsECFmYxzJCUodn5w2eI3mht9J7GIK8wMsfGcZ3eWEXzFrkBNeEL6w3VAZv
 sbR6vSF+S0QarYTe0Mg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-02_04,2026-11-02_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 adultscore=0 spamscore=0 bulkscore=0
 suspectscore=0 impostorscore=0 clxscore=1015 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611020062
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261102_153742_882393_053F67B4 
X-CRM114-Status: UNSURE (   9.55  )
X-CRM114-Notice: Please train this message.
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
X-Spam-Status: No, score=-22.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,INCLUDES_PULL_REQUEST,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The following changes since commit 25e73f1d6868c759c8eb56cad4e411692c5341b4:

  wifi: mac80211: reinstate IEEE80211_TX_CTL_AMPDU flag in ieee80211_tx_prep_agg() (2026-10-26 12:20:45 +0100)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/ath/ath.git tags/ath-current-20261102

for you to fetch changes up to 83d689bbe8f90ce39961bcc3a64f2ca2ec184019:

  wifi: ath12k: don't advertise EHT-MCS15 to firmware unless we support it (2026-11-02 07:16:28 -0800)

----------------------------------------------------------------
ath.git update for v7.4-rc2

Fix a few user-visible issues in ath9k, ath10k, and ath12k.

----------------------------------------------------------------
Baochen Qiang (1):
      wifi: ath12k: don't advertise EHT-MCS15 to firmware unless we support it

Benoit Masson (1):
      wifi: ath12k: assign device id from the WSI index

Filippo Falezza (1):
      wifi: ath10k: Stop unanswered temperature reads

Kang Yang (1):
      wifi: ath12k: set MSDU payload correctly

Lorenzo Bianconi (1):
      wifi: ath12k: fix decap of MSDUs spanning multiple RX buffers

Mehmet Fide (2):
      wifi: ath9k_htc: do not start ANI before the first channel is set
      wifi: ath9k_htc: start ANI when an AP interface begins to beacon

Miaoqing Pan (1):
      wifi: ath12k: Fix failure to create ath12k_dp_peer on MLO reconnect

P Praneesh (1):
      wifi: ath12k: fix IRQ disable imbalance in AHB ext interrupt handler

 drivers/net/wireless/ath/ath10k/core.c             |  1 +
 drivers/net/wireless/ath/ath10k/thermal.c          |  9 +++++-
 drivers/net/wireless/ath/ath10k/thermal.h          |  2 ++
 drivers/net/wireless/ath/ath12k/ahb.c              | 11 ++++----
 drivers/net/wireless/ath/ath12k/core.c             |  3 +-
 drivers/net/wireless/ath/ath12k/dp_mon.c           |  8 +++---
 drivers/net/wireless/ath/ath12k/mac.c              | 17 ++++++++++--
 .../net/wireless/ath/ath12k/wifi7/hal_qcc2072.c    | 30 ++++++++++----------
 .../net/wireless/ath/ath12k/wifi7/hal_qcn9274.c    | 32 +++++++++++-----------
 .../net/wireless/ath/ath12k/wifi7/hal_wcn7850.c    | 30 ++++++++++----------
 drivers/net/wireless/ath/ath9k/htc_drv_main.c      |  8 +++---
 11 files changed, 88 insertions(+), 63 deletions(-)

