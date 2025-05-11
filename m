Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7968C3ABCB
	for <ath12k@archiver.kernel.org>; Sun, 11 May 2025 17:10:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jULC3smUbir2sQ8Ko3wZXrwIOaL6D5kKTtXX4HTwYSE=; b=kz8rSRkEJ3K/EAjgNzwb7vmy2/
	VXyULCood5hPU80c7VtD8P/cEYVDLsyN0mJdNj/KyzZVTobastypDNAuQzmVQ6UhAkk7u2oT7PRmg
	h5UrbTWT0yh/AjAt3VHIXUrKsg1eLGp+hJCQZaUm7JUKBA2bjuqvkU0BsfkqSaqiBTz8eVVptvAPy
	gMVL1WjCMdPoR/ZJSc/p1UQnmL0R1ZzQR/2UIoVtu01DlbP137aIvjStj+pA+e+wKwrQ7BKuwEP+W
	LL4S+QcNH7bQ1IYdFzVxYTYUh9rteptGdrZUouDJmjGs2lodNISScL/yK1hVYprf4fa0WqDLaiyTm
	GIbIibHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEACL-00000007ZrX-2ezD;
	Sun, 11 May 2025 17:10:45 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEACI-00000007Zqh-2Vck
	for ath12k@lists.infradead.org;
	Sun, 11 May 2025 17:10:44 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54BBeTR8032356;
	Sun, 11 May 2025 17:10:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	jULC3smUbir2sQ8Ko3wZXrwIOaL6D5kKTtXX4HTwYSE=; b=mNs3iEKSm+nfI456
	SYHGfzdLvkz8093M/zWybOvmEshdkH6ErJkYiqtCDFAK213lw3WrpuYoMPbchfmG
	ESm2JB16Bz8Qys6NOrY4wiTEZp90TMSPzsZ9bMxK7+PJeMIrgh4bV0VLp7IN1+Ta
	APMkypOLYHDPDLHas+5zYeZuqAM8Iq/0A4uRQP9UibpNRcRrljWw+KOw+oAPF/I0
	GVDuHIJ2sdNe4tfGVZ2nIKRcOWjBXc17k42f5J5X3C2wtGejqi84ZmCXJAzOfmbx
	1mt7oXXBGmCGmFCRrCd7b5xT8dLZoo2USauMVbakKTYFWRV2U4GO4UExCZFK7Alp
	7HUG6w==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46hy15t7fu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 11 May 2025 17:10:40 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 54BHAdwc026767
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 11 May 2025 17:10:39 GMT
Received: from [10.216.19.89] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Sun, 11 May
 2025 10:10:37 -0700
Message-ID: <d76df512-5098-6e14-113a-bd22fa3b6245@quicinc.com>
Date: Sun, 11 May 2025 22:40:32 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: ath12k: kernel BUG at net/core/skbuff.c:209!
Content-Language: en-US
To: Alexander Tsoy <alexander@tsoy.me>, <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>
References: <9073c24c1fe0e00a8b925548c90ab2f15f3df2b3.camel@tsoy.me>
From: Vasanthakumar Thiagarajan <quic_vthiagar@quicinc.com>
In-Reply-To: <9073c24c1fe0e00a8b925548c90ab2f15f3df2b3.camel@tsoy.me>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: ylV-n422_uWIhhS5cw8eTATS0HzsJDVZ
X-Proofpoint-ORIG-GUID: ylV-n422_uWIhhS5cw8eTATS0HzsJDVZ
X-Authority-Analysis: v=2.4 cv=P9U6hjAu c=1 sm=1 tr=0 ts=6820da10 cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=VwQbUJbxAAAA:8
 a=Tz4NVP_pjGKKdwOvMcwA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTExMDE3OSBTYWx0ZWRfX00No7bJ/RufP
 gLJ+jea5i7UFGEn4EDmZ++smhMWh7ZlQYC/ovybdqruK+HbQpgBnCSEDcUsM3GSJIy6/aFjLykk
 rUhZNsx8jAzrip24B1QtJbg7FmHpX7nyGv9uxNQOJc6Lj+TGWO3nvsYoN5ZbEBvW2LUgI3D5AEM
 LLrvxcg+qfRR8Lv64l6kqLM5VfDgfHtvmJ9glduqPBtDi5zMDXDDLdnqoQG9X9aoD8ihTNNMQUb
 P+pzlVsTBNFRDvOb+IKHhN49l7jTsEzeI7BA7kOT+LOJKpwsM8neEBsOvQZi4yoeXmMbqOmGtmF
 /3fQsToOBt6lyL5kwgDxYvEV7WeUuKlPeMLCoWmveinDNsAZbZVWQO9i9dqZUlr6g1TZ6EExmA5
 DAifvTsTmz0O2TEEdXe/nLh2LqkRJECCOLB7WdWwdYjLdAC8LswXy8ayzhyHWXlmZ2hFwYXw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-11_07,2025-05-09_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0 impostorscore=0 bulkscore=0 priorityscore=1501
 mlxscore=0 adultscore=0 mlxlogscore=999 malwarescore=0 lowpriorityscore=0
 phishscore=0 clxscore=1011 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2505110179
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250511_101042_658189_ABA49057 
X-CRM114-Status: UNSURE (   9.14  )
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



On 5/11/2025 12:30 AM, Alexander Tsoy wrote:
> Hello!
> 
> I recently got two QCNCM865 (wcn7850) cards and experience kernel
> panics on different systems and different kernel versions. Card info:
> 
> [   13.584230] ath12k_pci 0000:0b:00.0: BAR 0 [mem 0xfc200000-0xfc3fffff 64bit]: assigned
> [   13.584252] ath12k_pci 0000:0b:00.0: enabling device (0000 -> 0002)
> [   13.584636] ath12k_pci 0000:0b:00.0: MSI vectors: 16
> [   13.584644] ath12k_pci 0000:0b:00.0: Hardware name: wcn7850 hw2.0
> [   14.210605] ath12k_pci 0000:0b:00.0: chip_id 0x2 chip_family 0x4 board_id 0xff soc_id 0x40170200
> [   14.210613] ath12k_pci 0000:0b:00.0: fw_version 0x100301e1 fw_build_timestamp 2023-12-06 04:05 fw_build_id QC_IMAGE_VERSION_STRING=WLAN.HMT.1.0.c5-00481-QCAHMTSWPL_V1.0_V2.0_SILICONZ-3
> 
> 
> Kernels I've tried so far: 6.12.24..6.12.28, 6.14.5, 6.15.0-rc5
> 
> Synthetic load like pumping traffic via netcat or iperf seems unable to
> trigger this bug, but something like downloading of Steam games or
> torrents is triggering this bug very quickly.
> 
> Any ideas on what's going on here? I'm ready to test any patch.
> 

Can you try with 
https://git.kernel.org/pub/scm/linux/kernel/git/ath/ath.git/commit/?id=763216fe6c5df95d122c71ef34c342427c987820 
?

Vasanth

