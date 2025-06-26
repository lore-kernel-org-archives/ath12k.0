Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CFC8AC7EE31
	for <ath12k@archiver.kernel.org>; Thu, 26 Jun 2025 17:24:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5dr6TvuI3dg5mwfS1TqhKy7UB0zjUv4LQeJ0SMajz7E=; b=pS8e9iKzgdJZRqhpwUF0fvAcpX
	Vc5QhNG5/oQ10dBGHvfCx9uelkm6YDxBvGZUm3AkxgxA5dCvAxBrvYIKKjF6HZsdClwEI2EGvB6CF
	JBiIt8BBpNmIIR1wCnctD+O5+hyoPIWDt4SioSyTwJ+LjIktze95WbYqzwH/kikXKjkEH5ZdPMFWB
	BIfDGxM2qjCFmUOiec+ERwClytxa9ILyB3tx+3ssuBKZhe7zUqCWFBuGKtJIDZ5iCw87EjKyghtQJ
	pCzBe80MWDJn2XCt3zpkv7mAJkYCqTZ9wYvoFRubhVdUkiyPIz1DwrfCQT9xm9s5ZA13F8LX2DdMZ
	yOurhvFQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUqKl-0000000CMo1-2a86;
	Thu, 26 Jun 2025 17:24:23 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUqKk-0000000CMnS-2nGi
	for ath12k@bombadil.infradead.org;
	Thu, 26 Jun 2025 17:24:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=5dr6TvuI3dg5mwfS1TqhKy7UB0zjUv4LQeJ0SMajz7E=; b=iCp90lWXxmrzrcKYl+6yJL6/Oj
	WSgj8MWYuihiuqfyc7y/k0nz3NHSJ4sLTqvS+Xo8qAUDzYcIwz/vQKnDmGLK8dDlXRXlx82u4fybq
	T++N4vSRRbwnb8/71N79BRf9+JuazoZrBFdYQbsNGIyqsRAXxYf0by/jcp/MBPNKJriY0WLnT7NQ3
	Y9noF/Vi9eUsx+7+FNLu8nJbjGTOsVy0aR6SAlF90tbpa2HreBVf4QRuERC+C2pBprrxMMdXtpG8e
	BEmZdN1Mvs+CYF75bqbMbVKHbHj6V45Kksdmb6sBpIVDs3Vzma+jI5ILjtK2u70R+nRpvnU5wBpf5
	ZAGx3Kzg==;
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUqKh-00000006B7L-1gJ0
	for ath12k@lists.infradead.org;
	Thu, 26 Jun 2025 17:24:21 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55Q9UFDK026643;
	Thu, 26 Jun 2025 17:24:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	5dr6TvuI3dg5mwfS1TqhKy7UB0zjUv4LQeJ0SMajz7E=; b=lCSGG+F/MRHiZJk/
	RXO1voX3A+bF+B1saA9RHuthFU+QoIo125HuwpMHTxKntrHJkFGik/jmqnuaqUJB
	O3VmAgtlw0X184Sz6db85wjKtdFlTgS2iIS3QSDjLq5UKCM6OgJ8O8MDN2l2mEmW
	r8IMZHoBwIPmjD9afZYFoYaZeCIn5UzcLBb6FRnNtMs0wj5tBIuBk4OFgNb5Sgph
	LvJWRw1teoeBFQT3/xndc3z8md4Rx+4Ee3JdgXYHX16RLnvZO39DYrbzyj6hfTqO
	wK+SbUyu0R0XBA/JjNj5ydjt34FDf55oOOv+R0tC3nEWaFE9BVZQBu7GFQfaW33+
	VFlumA==
Received: from nasanppmta03.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47evc5wa62-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 26 Jun 2025 17:24:13 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 55QHODjK019146
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 26 Jun 2025 17:24:13 GMT
Received: from [10.216.56.23] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Thu, 26 Jun
 2025 10:24:11 -0700
Message-ID: <e71c733b-0f0b-58f7-d881-301e7aa60df4@quicinc.com>
Date: Thu, 26 Jun 2025 22:54:03 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH ath-next 0/2] wifi: ath12k: Support TDMA, MLO, RTT stats
Content-Language: en-US
To: Roopni Devanathan <quic_rdevanat@quicinc.com>,
        <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>
References: <20250617051136.264193-1-quic_rdevanat@quicinc.com>
From: Vasanthakumar Thiagarajan <quic_vthiagar@quicinc.com>
In-Reply-To: <20250617051136.264193-1-quic_rdevanat@quicinc.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: 5G3mk_zUOE2kYOtkP9Ujb3qe4KPqOIpq
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI2MDE0OCBTYWx0ZWRfX8e5DH2XknED2
 JRUJbFve5MX3+yMfJmuAdsUszjlPuq9osafz3qtFqJ4e/TyebXdDn0uCywYY57CVYgsj0Gmqg3x
 XnlcByQck8aHTX+neRct/D/lEwBdWO1kvzxuxmVZ+PQfw/9kfMU9wpSztN8b9wttpYsstDNeJDn
 r9azW1aJriXPWO1L1uDyfJo6X2xLGutZ0tKOCULdCA2QCVza1dHRmyQ0oR7wnSR9+xsa3pbdJQM
 vt4fWPLSY4vgQdMh4ketdRamTj/Q40Ra76I2k/j7ZN/b/o3Wu+OHVrOpo5fILl3aOc94rUJ/9QF
 /wJ2UztVXDxY2g36QihcW+OfnXjnPBGsKAyQvzqTTREz13I2dJl+GleNHpVNTdKuio1AqAS/LlD
 GZGbeXtS370jghMiKB5krQSDZL08JW9QS1vteUSth8namQ1ZgcN3dF6yiqesFPLF88cPc6o7
X-Authority-Analysis: v=2.4 cv=caHSrmDM c=1 sm=1 tr=0 ts=685d823d cx=c_pps
 a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=EUspDBNiAAAA:8
 a=PERqVRO3yxHNNTxRS38A:9 a=QEXdDO2ut3YA:10
X-Proofpoint-ORIG-GUID: 5G3mk_zUOE2kYOtkP9Ujb3qe4KPqOIpq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-26_06,2025-06-26_05,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 mlxlogscore=852 suspectscore=0 priorityscore=1501
 lowpriorityscore=0 bulkscore=0 adultscore=0 mlxscore=0 spamscore=0
 malwarescore=0 phishscore=0 clxscore=1015 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506260148
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250626_182419_922395_35658A07 
X-CRM114-Status: UNSURE (   6.37  )
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



On 6/17/2025 10:41 AM, Roopni Devanathan wrote:
> Add support to request HTT stats type 57, 63, 64, 65 and 66 from
> firmware. These stats give TDMA stats, MLO scheduled stats, MLO IPC
> stats, RTT response stats and RTT initiator stats, respectively.
> 
> Maharaja Kennadyrajan (2):
>    wifi: ath12k: Add support to TDMA and MLO stats
>    wifi: ath12k: Add support to RTT stats
> 
>   .../wireless/ath/ath12k/debugfs_htt_stats.c   | 516 ++++++++++++++++++
>   .../wireless/ath/ath12k/debugfs_htt_stats.h   | 185 +++++++
>   2 files changed, 701 insertions(+)
> 

Reviewed-by: Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>

