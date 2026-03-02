Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8FB7EA4E26
	for <ath12k@archiver.kernel.org>; Mon,  2 Mar 2026 15:45:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:From:Subject:Cc:To:MIME-Version:Date:Message-ID:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=mBzcckmfYCVo7odpi5kuU0OBvpH27akeSOBo8YM08RM=; b=RflqpFNqP6Iw0F9ZmGZtedzFXR
	rJh53pXswsY8rSb779cTs8uSJGMW7KQTZpIOalrvTKTgu+U/SNHQJWizhdD4S8UyTACs52mpdcBIZ
	WiWexMRWN9lNGXQadm/m170RZp2ZxBFc0O2zBNRY2/BnafOPz45jDxzHaAV/6UewEuX0q4r2pJCK9
	ZUwMOPTz0xuYOmhtgp8hdke/zH3h2NukaVUxNyy2bvFFj84r1bTk0R4CqMAE0+gPcS6nqZWqa4lv+
	xtBd9Gt6Bn0hk5Nk0Hc4CPp38Lf+ZRhKxSkV77NMFYzEdPqaPCnEW/cyZUrRKMtt9/kicurAujb8m
	DcqRr/Bg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vx5T5-0000000DOcC-1iJp;
	Mon, 02 Mar 2026 15:45:59 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vx5T2-0000000DObK-2D0H
	for ath12k@lists.infradead.org;
	Mon, 02 Mar 2026 15:45:57 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6229JZcv3742057
	for <ath12k@lists.infradead.org>; Mon, 2 Mar 2026 15:45:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=mBzcckmfYCVo7odpi5kuU0
	OBvpH27akeSOBo8YM08RM=; b=ml8cWgaZwe545X0cKY+uG9aA5asSwZdUoYE3st
	Jsad7DdbRW1PIPYImxAeHSOc8hVd3/VttMb8SmkJB8bcGyiZq3Q0ZeBboM1PBjmf
	QL30IQWUTT3dZDyLvhydj2hpG9EC97dKck60yO1vBMEpvhxBFDVcHyennuJyrpfN
	4Wjrhb1fxQ7Ny18TNfrg3WuExi2PglT91NAspFLawvTyHlf5syVkL19slUzGgrDz
	3oTRnDfcDmHUzEhxw9zNq1YF4fseBGHHbtk5NSu50SPJnzMOL9ecP0efg1hq7jUj
	ZZ6jdVX2qV4isYRVrI65D125KrM733APfgyoOA2T3gymCefQ==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cn7trha0b-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Mon, 02 Mar 2026 15:45:55 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-2be191ce356so727329eec.1
        for <ath12k@lists.infradead.org>; Mon, 02 Mar 2026 07:45:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772466355; x=1773071155; darn=lists.infradead.org;
        h=content-transfer-encoding:from:content-language:subject:cc:to
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mBzcckmfYCVo7odpi5kuU0OBvpH27akeSOBo8YM08RM=;
        b=fgXcwhq6puHSGxszF9TvDBOSoGdGXMh96f694QC0rgu7+3UAyH8mKo0XNtTWgHgU0d
         AL+KiNNLqmTsgqB8bUsQol5Ni1lJDI4yIelWqkrDvhZPHHm+T/Nb+Y0Pgy6dfCLiTE6h
         BdIMhiBBzHiS0yCAr5dKzxq+QCqT81hPAfVBQjS1QBCPX2cbRKYIWu2J3hrSQuMU/8Cn
         wcB1DyiDMCsRJKVMTHcRdnagPpZScgrsqeYHqIb0O/KEzN8cdKPnNWzElip/Dc69EvxN
         ry2tkdmXxnya+1eBvcYUBhiIWB2MN7C2EINO1iM1/HfehRTTggjXPjQyGzAdsn2I9PZB
         ls5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772466355; x=1773071155;
        h=content-transfer-encoding:from:content-language:subject:cc:to
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=mBzcckmfYCVo7odpi5kuU0OBvpH27akeSOBo8YM08RM=;
        b=jxsYKrg0epIGUlOQMAu3DBq9cmMh8CtDMGMi9HWcymiJldikvyLqURRw5dHtVwoYGK
         T0W3VDbksh12jWo8PH53XYvGrHJ4tDVI9MAi6akFJ5E5aWkKJaHW3OpN7pKy3VqQBisO
         PM1OIK7j4BBx7lPlxRs9M8wGMZtiPaftcSOZY8P7WQnn+oHb/V/KX2fRV24Mw2cNLw6+
         SVcXJEri1j1qIxg3ZATgWvfV0E6/SArdDi4K4pAamN0F8a+idgt5VqJNAPAahcKALsEU
         5KGlPj5FrPLYBvVG8xaU8EEYNxERS7S0PkOh9r33xdoRlIyy2zC2xs4V7oijt0/ivxX7
         Woyw==
X-Gm-Message-State: AOJu0Yy7tAZHUg3qKmsycfV3F+pXR+5DCB/ddkE9p1u+SV6MVwz0XxJ3
	SFilwvMtP/gwjoEnREWdmLNlWspWZX2WNvPhZq8UcliQSPNIqpG/tkm5olOSCRo0xqclt256bLV
	CBWTjOWvD6+GKW6jzxWqazXue0MAUsa7H5+S8KWg7vbsH9HYjJzcNvOil0eQLVOA3
X-Gm-Gg: ATEYQzwX9JXFIrOdnoWq8vDyy+MmjDnHZ/6qz/LR/SXmPEJdoK1XuXEiRaFA+rn9I5p
	pvQptgWNFgQaDAMW6DElMNbg57cc9u5ma1ne7kOkkvGq0t1kneUPf6hX1SMzLKaa/dhnO2iOT/s
	ZzPOtDwZXy8F+5lodUm+SuH6N56mpvo/k0hR4zpfl96WQ7NzNa6L+vQM3zWf6BuNxk+g9jrwrQs
	th0Y8yGcchYzwl2FuNqv8cCYmh5EyXIgUQ3hTH3cDrYN8tFwA7p4J+1vJzVjcV9YGjt2DYmuUYR
	n12UjtSScs75TFpN7NhAcxxeHOlFIh7ZWpE0TRXzY34A7SYRuLbeWpusp3qAWiAUbLdvK9bHFzh
	aQmH6RIbVR363wCtLBtiNr8wyMVmTppsS9ui3DKWHwhmqWZgcUr+hPT8Utg==
X-Received: by 2002:a05:7300:880c:b0:2be:e4b:60bd with SMTP id 5a478bee46e88-2be0e4b6291mr1135154eec.6.1772466355130;
        Mon, 02 Mar 2026 07:45:55 -0800 (PST)
X-Received: by 2002:a05:7300:880c:b0:2be:e4b:60bd with SMTP id 5a478bee46e88-2be0e4b6291mr1135142eec.6.1772466354486;
        Mon, 02 Mar 2026 07:45:54 -0800 (PST)
Received: from [10.81.91.45] (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2bdd1f7e955sm10988694eec.32.2026.03.02.07.45.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Mar 2026 07:45:54 -0800 (PST)
Message-ID: <830f20b3-076a-4ad3-8cfc-5920c66e3f35@oss.qualcomm.com>
Date: Mon, 2 Mar 2026 07:45:52 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: linux-wireless@vger.kernel.org, Johannes Berg <johannes@sipsolutions.net>
Cc: ath12k@lists.infradead.org, jjohnson@kernel.org
Subject: pull-request: ath-current-20260302
Content-Language: en-US
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzAyMDEzMiBTYWx0ZWRfXxzNUi0SKIvtd
 6TE+967bf8AQsSDRpydaGzotvQdQ4H/pvp4/AdkUY8ppwndYcEsx0YiKo3PT0QO/HnR/GaqGuet
 Pom3PxLOE1l6U5khXPgn+pjFoDPvw+jDhV8pDxZoeSDmOx6qiIqEe5HAHl0zdnCqwNmgDMt5stu
 cYabGvVQ9VAK293N2I4VVsFzXNHRL064b7h69fbFiicvHdBoN4RD/zEHmnvxNBs6ky4l/I3TRqW
 zo4bK35gKkScqEzCg/QQOo9D2y5FfxrT/QcLzn5EfitzeRsV3W9Hebl63/eMOgf6ouY2fdJNNaw
 SNYxU1pai4qpLTGuoF1eYRK9JWeCQbKFzujVO1zEWcyK0+YDSBE+Y+tY9Rd8UHfN9MY02oelcfR
 7GToBRzUkh1me1QfJBVCchceu2MD8MvfgPjqVlA0EmzZHUBOT46iyBdN2acjb051heNymEqyneq
 bKhZlQgVZS3iyumFM/g==
X-Authority-Analysis: v=2.4 cv=TNhIilla c=1 sm=1 tr=0 ts=69a5b0b3 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=VwQbUJbxAAAA:8 a=FL5DRaERdKlnwrn6VaMA:9 a=QEXdDO2ut3YA:10
 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-ORIG-GUID: NeEbzqSh4mx_CZezBnjnrDj7kkFjLhwI
X-Proofpoint-GUID: NeEbzqSh4mx_CZezBnjnrDj7kkFjLhwI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-02_03,2026-03-02_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 bulkscore=0 lowpriorityscore=0
 malwarescore=0 spamscore=0 phishscore=0 suspectscore=0 impostorscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2602130000
 definitions=main-2603020132
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260302_074556_584511_D754BF51 
X-CRM114-Status: UNSURE (   7.03  )
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

The following changes since commit 017c1792525064a723971f0216e6ef86a8c7af11:

  wifi: mac80211: fix NULL pointer dereference in mesh_rx_csa_frame() (2026-02-24 10:03:10 +0100)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/ath/ath.git tags/ath-current-20260302

for you to fetch changes up to 7259b1a0e54c2d3051ac8f1eb01de121b11118ea:

  wifi: ath12k: fix station lookup failure when disconnecting from AP (2026-02-26 07:18:32 -0800)

----------------------------------------------------------------
ath.git update for v7.0-rc3

Fix issues with ath12k station statistics requests.

----------------------------------------------------------------
Baochen Qiang (2):
      wifi: ath12k: use correct pdev id when requesting firmware stats
      wifi: ath12k: fix station lookup failure when disconnecting from AP

 drivers/net/wireless/ath/ath12k/mac.c |  6 +++---
 drivers/net/wireless/ath/ath12k/wmi.c | 36 +++++++++++++----------------------
 2 files changed, 16 insertions(+), 26 deletions(-)

