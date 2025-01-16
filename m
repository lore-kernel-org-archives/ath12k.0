Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87B6BE77188
	for <ath12k@archiver.kernel.org>; Thu, 16 Jan 2025 03:35:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pKEMTFQnE6LXHriQanUkRbslR6ox7gFNHELOXEQx7Hg=; b=rWmOxskOjleLCbt3rYxiCYM81s
	CMguAe23qsYQvS+ufGhgsva//e804ncu6lzoH+lJ6xJw9rKIiCyC6zqf7B+KXMULxt3dErjl1Xl1F
	HH7jHsz9k7YYPrESWFQOJ0IswsO2S5ixfpIDqmpJ3EsohDRog4NKwTxeWh0DWBtibmWFFJYv+gYNa
	HnoGQSXkUH2SotvkRqhZi0vsDs6fse/eMaoLvhclMexMRQGkU06cUJjC6pljs/SP/BMA5InaMb3re
	oSwcw8ggF/dqXSA6KVFtxR/z7FvkWud4/TNAI7I7Vf2c4URkddhdJK4qtgSPfrP9W+5IjJaBJl2jE
	rBfeYFMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tYGfR-0000000DjvJ-0swS
	for ath12k@archiver.kernel.org;
	Thu, 16 Jan 2025 03:35:37 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tYGfO-0000000Djut-49n4
	for ath12k@lists.infradead.org;
	Thu, 16 Jan 2025 03:35:36 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50FKrgGA009825;
	Thu, 16 Jan 2025 03:35:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	pKEMTFQnE6LXHriQanUkRbslR6ox7gFNHELOXEQx7Hg=; b=mp/293++PwiwCuaD
	IidLynvDN8iioXzkHj4yw8pj5/dX/XIgW1pd1hs2y/GKrZjpbtAtSG1Y9+qzPsIj
	b+xtpLkg24m32FxrtZ/9bsc+ffeygQupfRej3fl66iFz6uIM9VJkoZMwArJTFvmL
	eVK9KO3k3mizyjvFvLy6/yIgbc4cdo0LISgYp8KKNYkL24w/zFB2f4+z05+lFUe+
	dDOsiqfpNdikljyOHLGQc/UlKT5o1Ma6T1Ae0fLIiIqo+ym/bSoVwCnZkzK61pLT
	mQZkLXA1jeiwyHIzgmCtynHwl175R/WrWLogsC6Ty8u7VLtVdOrJxy167vltCD7X
	xXYWEQ==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 446mf2gr0d-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 16 Jan 2025 03:35:33 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 50G3ZWS0017600
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 16 Jan 2025 03:35:32 GMT
Received: from [10.216.35.176] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 15 Jan
 2025 19:35:31 -0800
Message-ID: <6abe8c92-d3e0-40f4-8af7-67bf863c868f@quicinc.com>
Date: Thu, 16 Jan 2025 09:05:28 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] wifi: ath12k: Fetch regdb.bin file from board-2.bin
To: Aaradhana Sahu <quic_aarasahu@quicinc.com>, <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>
References: <20250116032835.118397-1-quic_aarasahu@quicinc.com>
From: Aditya Kumar Singh <quic_adisi@quicinc.com>
Content-Language: en-US
In-Reply-To: <20250116032835.118397-1-quic_aarasahu@quicinc.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: 8v5r94HlrK9SCvu-762vYQ68GQh-VmOw
X-Proofpoint-GUID: 8v5r94HlrK9SCvu-762vYQ68GQh-VmOw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-16_01,2025-01-15_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 phishscore=0
 mlxscore=0 spamscore=0 impostorscore=0 lowpriorityscore=0 malwarescore=0
 mlxlogscore=901 priorityscore=1501 suspectscore=0 bulkscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2501160022
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250115_193535_166153_D366B5E3 
X-CRM114-Status: UNSURE (   6.06  )
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

On 1/16/25 08:58, Aaradhana Sahu wrote:
> Currently, ath12k_core_fetch_regdb() finds regdb.bin file through
> board id's but in board-2.bin file regdb.bin file is present with
> default board id because of which regdb.bin is not fetched.
> 
> Add support to fetch regdb.bin file from board-2.bin through
> default board id.
> 
> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.3.1-00173-QCAHKSWPL_SILICONZ-1
> 
> Signed-off-by: Aaradhana Sahu<quic_aarasahu@quicinc.com>

Reviewed-by: Aditya Kumar Singh <quic_adisi@quicinc.com>

-- 
Aditya

