Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C585BCA6001
	for <ath12k@archiver.kernel.org>; Tue,  6 Oct 2026 14:15:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:From:Subject:Cc:To:MIME-Version:Date:Message-ID:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=9VpjXu4u++QS3E8EyJb2g7cB91QeLt7IH+hYNOWUP9A=; b=o/SDL5kvVYSpDyfobTZyT/T5QS
	jqtQKvr9aqNoB3SsUjVIJg5vSj1Kd0KY4WGBOG1xNtVfLa3ktWzvce/2ydV/9TA5j2aYu59C/BVNc
	DUgowZyvgD/nERaDiy5NHNoCUgjvIa8GcAXU3tWWikV/JRU1aFE3oSM62pptC0KMcHpN+zpbBibnT
	1wNDkqYmrppULx+tF1BG+dePrTVlEBsRmbizGDfVHu6jNd57rsFsheH11w7VAxGvYUPPORTkk+3EX
	5VfcElnzawV9U2g0pKRX707uHLbPyBp48uTaOspO80kaQXyY8VxAiK28cQC6U6Amxz1A5is8ZRAFg
	lqsc6PAw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xE5xC-00000000wEK-1jBu;
	Tue, 06 Oct 2026 14:15:38 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xE5x6-00000000wD3-2Vaa
	for ath12k@lists.infradead.org;
	Tue, 06 Oct 2026 14:15:38 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 696EB13M2065469
	for <ath12k@lists.infradead.org>; Tue, 6 Oct 2026 14:15:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=9VpjXu4u++QS3E8EyJb2g7
	cB91QeLt7IH+hYNOWUP9A=; b=jXgiq5syPqWR17xoDARptpVKQuXWkUINiWZ72i
	Lze+1gDJRFXKWKPJMktJRwN1R/lIWfOomxkU1w8FcAo4gJOh/jpdJdk64sg0Uvzm
	3J0CeX7Cf6RENPiRCunFFYIfX3ipxUo1pS9fgM/Dff86kW0rpAvIAe1bOrBYkYFw
	NUh4JMBpDlNV6pAM3EF14O0VkOAs5QM1kgOWj5fG44dG9EgdWSUghlsvMAqBbDAF
	3BhenvodscstAiaew/DEfm03CB7XTfY2AyUx20dxrZrVCIcWznzmr7wkbkHFWTYA
	aYAC19u3vvpwXiNXyHS9Ez+51YOoJNlgEZ2z8RsaLXNqsY7w==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h4xc5102a-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Tue, 06 Oct 2026 14:15:32 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-88a46301d92so2404119b3a.3
        for <ath12k@lists.infradead.org>; Tue, 06 Oct 2026 07:15:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791296131; x=1791900931; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:from:content-language
         :subject:cc:to:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=9VpjXu4u++QS3E8EyJb2g7cB91QeLt7IH+hYNOWUP9A=;
        b=H5BfqlpHozRDSDB2bt5E/ZcbkWcHRAtT6JvxweVf8QrvocgqKDnYErOF6wDChhd/3b
         ziwV/WQ48OQnJTnCmaWnlbX8ssdXxVmyJdFRIEn8c9sSKZQ/Us2784T+khH9iF5OdCB+
         rJdnIqqUMj/7IG4sk6NH4bo46bgdtCYQqrb2aJ8xPBXSvmmrnXyZ7PZlMAjOmurfC55i
         IdM33Tvi270bvtrVXGJQvJTuTG7AXJhCYJZUW6zpPFPnmas626cmby9fwmn+As/zBlYL
         3xdHNPvW+eVLeKRQmunHMoalTo5LFr5yIG8VtcKD+PqB5CRxASKp663leT1VSAKkswXu
         Ns+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791296131; x=1791900931;
        h=content-transfer-encoding:content-type:from:content-language
         :subject:cc:to:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9VpjXu4u++QS3E8EyJb2g7cB91QeLt7IH+hYNOWUP9A=;
        b=T8RXkIfBkyV4jV8GXqHG+pNgRpLJD1Wz/Msrtp7KFGu4O6GyH6rl+dvUqax4t32Vq7
         FiKcd4VmWHQ22G1X0ay1LgRnZmwSGGosOgX00Gyzfu1Kh0aWqfPXX5vG72K2JvbBkkXY
         liYvqk2X1NBIkcRqkkbHDy9FEEpKDLIjqMj22uZ2L618Tu0LN4q2oQ1/DHj7Keig8/mS
         /XtSsLLofA34TPcuNuDzIiL3dPEgMCTHcB7Thi/L/B32HNATjLXhTyqo22609QmQKswY
         qg+vuTGNDYbweBi+Xdj41AvaDP/XgXtQc6eqhP43MhVF7V/mh0oyt7YjOOCZ6yhXhuwk
         Rusg==
X-Forwarded-Encrypted: i=1; AKwUvBwq0fmMy0n5+n6l9cm7YQ9WpifCaEzYGFGbkOrCjxRpoUl/v3GYPCGX/F1M6Js2nTsh/HNIr6Q=@lists.infradead.org
X-Gm-Message-State: AFuF++m03LSxxZ0pN0msjjCYY01D+0sm8YQCu1MahfOFYnXbR69x02Iw
	y3dFY3Bpuu1LRadZ+L+4Jr+Yq1NOm8fqvyOc92KMExyf6qy0ZeYtkx+4nBqCqnir/VbGPB7Jigw
	kbe3y3s7HCYQIfydI16lbHtimIj/1XaFUQsyHZ/31p4M/AkoPPB1fwJpjHoF8nM3e
X-Gm-Gg: AYBFou19AfbnqVD5jL4eUzLoxTGfc0tQufxnKSYorCs6oYQyCPGs2jfHFgd1atMSgTj
	ceV4ilin9w82GRoc4McGeOZZz/mS/qwNZhcM7QlT3lhr487V2ZAPJ4W0riJuC38FCLR4eVY0SCV
	q5rd13sqePt+JLykUDABQnxRp4Nnvvsngl/OiAgib08o+MYKbRS9eWJXGVfB9VUN3kBKpAMRTo5
	2qbgqRxxIBHDrOeTanIKgJl4RLsIV6KGRYGqbxZoawjEN3DNhSq7cM7tTK+2Wz465u3w4P9F8kB
	dobc8GLZX4H6osxDKXTdTj7NXeDKudfnNho2aSX/6Y5j+822vq+PsTMUFx2JQJ/umaJ+q2DtzJs
	sPPkWUCnOsPFp+QELZGWPcoyp+RBwNPRjDTuj
X-Received: by 2002:a05:6a00:c50f:b0:891:3e34:e07e with SMTP id d2e1a72fcca58-8913e34e55bmr360944b3a.34.1791296131200;
        Tue, 06 Oct 2026 07:15:31 -0700 (PDT)
X-Received: by 2002:a05:6a00:c50f:b0:891:3e34:e07e with SMTP id d2e1a72fcca58-8913e34e55bmr360919b3a.34.1791296130606;
        Tue, 06 Oct 2026 07:15:30 -0700 (PDT)
Received: from [10.81.91.45] (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-88b0c1b1dfbsm5131184b3a.26.2026.10.06.07.15.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 06 Oct 2026 07:15:30 -0700 (PDT)
Message-ID: <dfb5d597-f2cd-4ce1-8eac-2c2b74dc25f7@oss.qualcomm.com>
Date: Tue, 6 Oct 2026 07:15:28 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: linux-wireless@vger.kernel.org, Johannes Berg <johannes@sipsolutions.net>
Cc: ath10k@lists.infradead.org, ath11k@lists.infradead.org,
        ath12k@lists.infradead.org, jjohnson@kernel.org
Subject: pull-request: ath-current-20261006
Content-Language: en-US
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=X5THu2Te c=1 sm=1 tr=0 ts=6ac50284 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=VwQbUJbxAAAA:8 a=6eATFoqnGXLanKaFIDIA:9 a=QEXdDO2ut3YA:10
 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA2MDA1NiBTYWx0ZWRfXzYX87Iehhfmy
 kvICWRU488IDqwP701tsDVjjpNzkCL6aO+BHujFUT0GcBaqoNEtgBl2mT5EiIyXYOCVnNXt/8HU
 5uIMjySe3LgFpdySIORPCBAK6JfIFos=
X-Proofpoint-GUID: 8DYbEUrJgYr0cNRKr2ajThGDA5rHMB7n
X-Proofpoint-ORIG-GUID: 8DYbEUrJgYr0cNRKr2ajThGDA5rHMB7n
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA2MDA1NiBTYWx0ZWRfX3Gpt95Jm5d+Y
 U7sU2s7mkiAFqDtZarQhGWs51/d6N0ETaGTHI2T9Z81Yyj3lR4beDP3VV3Mnfn1zvChJ437WkTc
 9WmNfHmDBr/8iQZe7MuB0q0Ho7YtP9jyTKvsHYThX7jbRqbZ+Rxchw/45ed5ItZe34UGtiQLr0M
 UtN5fYcLrc/66R9uVdulRabIuXR2BUBafR1AJ88DAh127JJ7hew1iVvQV9aMhGtHJM8ymw6T1DH
 j3uoxlV10MtLEdxE24VR09W8p6pq4Hd3SirkW/iUz3Wu2OVhk06wU5j653wFShI9/Fzvp1z8wVZ
 cu9JDKgLeSjtrlNfskxMxzKZCazJGnjjrU3KNZ+lY0p/xdErP+JwAJl/gfcfjA7zdaN8BE2pN+a
 IfbhtLXRz4GXwwiWBcKhLwSrgczG39lj4vIffizgrPbHZGZJx2kCuytGxYbBhbuCRNW9aLl71+L
 arAc30OsS19z2EgA1ZQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-06_04,2026-10-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 malwarescore=0 clxscore=1015 phishscore=0
 priorityscore=1501 suspectscore=0 impostorscore=0 spamscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2610060056
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261006_071533_929987_D69144B6 
X-CRM114-Status: UNSURE (   7.94  )
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

The following changes since commit d24e8ac715de2e16a53c144005b1863660a5fbea:

  Merge tag 'net-7.3-rc6' of git://git.kernel.org/pub/scm/linux/kernel/git/netdev/net (2026-10-01 06:41:59 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/ath/ath.git tags/ath-current-20261006

for you to fetch changes up to 05165f7b3b9ab6817fe216c24f90755b7c5e15f3:

  Revert "wifi: ath12k: add panic handler" (2026-10-06 06:42:17 -0700)

----------------------------------------------------------------
ath.git update for v7.3-rc7

In ath12k, revert the panic handler that landed in v6.11 since it can
perform a voluntary context switch within an RCU read-side critical
section.

----------------------------------------------------------------
Yingying Tang (1):
      Revert "wifi: ath12k: add panic handler"

 drivers/net/wireless/ath/ath12k/core.c | 33 +--------------------------------
 drivers/net/wireless/ath/ath12k/core.h |  3 ---
 drivers/net/wireless/ath/ath12k/hif.h  |  9 ---------
 drivers/net/wireless/ath/ath12k/pci.c  |  8 --------
 4 files changed, 1 insertion(+), 52 deletions(-)

