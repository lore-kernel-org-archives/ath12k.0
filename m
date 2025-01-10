Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BADC4E77188
	for <ath12k@archiver.kernel.org>; Fri, 10 Jan 2025 05:59:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LChIw8KttW8ns5e7/XjPKfY98d85EMV7RattVzpNTN0=; b=c9esQ+lgND279AQ0mIoQOzKuGs
	FuZl2CNdU5Ut0xSh7z11BFzBr77QphHvJdFHjIJKxJJM8Jd9+jGzoN/XkZ5JVDvh4c2p3lmNeLlmG
	sf/fbQgBaOo5NYXIwogLDf5z4MG+fcNtYlIbpWAAv2/zwSjUy4K/mu9bP5wt8xNmyxBOCPCGuWyG1
	ZOCrWt76cjy4+whIye6s4JU+vVnjCCuKcIOXT0Dz8ZrYLrZXFlpbUsD/9DtZpDCY1xQl/Lid4uXuQ
	bWEhYh5JJoqfcvfBMrZK5lFYVB7xVM4IyeZtQBBSD4b7JcModTS2emXCpuEBq+fwsE9XXD6EwaVle
	XepkLw4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tW82v-0000000E80O-24Dj
	for ath12k@archiver.kernel.org;
	Fri, 10 Jan 2025 05:59:01 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tW82t-0000000E7zm-17Cr
	for ath12k@lists.infradead.org;
	Fri, 10 Jan 2025 05:59:00 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 509JqgMn009189;
	Fri, 10 Jan 2025 05:58:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	LChIw8KttW8ns5e7/XjPKfY98d85EMV7RattVzpNTN0=; b=hFLXBVNyrL6eWlAZ
	XWG+U+uEGeJdly7fSVqACFtSElqtGN3FTMzuLwrpt5C+4Ro/O10f0cXY4YqLEqnz
	Q64XniHLnoQXktrT/w6cLS1lzNuHZNFVai9SEJwKbiOHJti++YZwDQPDrczjt/l/
	ip+KkCgg+CRFawSvSAaXo94RRYoibN61zRoesqHf4rjY9eqoQCnBThqCHSLjzSm7
	wPiWq6U5RSYQXEEqFBigoefVU+0uv+HRbkoOe7XLnahCWx7qRbKfkIf4mSHjXgy7
	SIrkmQmpVgD01nKtXsE448FXKO4htjK2m9izAM35RuIX4cckwLiQDXcUB4EL7peA
	J3W/aw==
Received: from nasanppmta05.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 442n0gh46c-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 10 Jan 2025 05:58:58 +0000 (GMT)
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com [10.45.79.139])
	by NASANPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 50A5wvee026173
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 10 Jan 2025 05:58:57 GMT
Received: from [10.152.193.243] (10.80.80.8) by nasanex01c.na.qualcomm.com
 (10.45.79.139) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Thu, 9 Jan 2025
 21:58:55 -0800
Message-ID: <2db99d33-039b-4a71-9bc3-29d15d8c602e@quicinc.com>
Date: Fri, 10 Jan 2025 11:28:53 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 5/5] wifi: ath12k: Disable MLO in Factory Test Mode
To: Jeff Johnson <jeff.johnson@oss.qualcomm.com>, <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>
References: <20250109183551.1028791-1-quic_aarasahu@quicinc.com>
 <20250109183551.1028791-6-quic_aarasahu@quicinc.com>
 <dea8d952-92df-4a7c-9622-288921b23332@oss.qualcomm.com>
Content-Language: en-US
From: Aaradhana Sahu <quic_aarasahu@quicinc.com>
In-Reply-To: <dea8d952-92df-4a7c-9622-288921b23332@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01c.na.qualcomm.com (10.45.79.139)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: YxW2J94IB-yf9s9f0degfV5VgYoJzJi8
X-Proofpoint-GUID: YxW2J94IB-yf9s9f0degfV5VgYoJzJi8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 lowpriorityscore=0 mlxscore=0 suspectscore=0 impostorscore=0 bulkscore=0
 spamscore=0 malwarescore=0 adultscore=0 phishscore=0 clxscore=1015
 mlxlogscore=685 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2501100047
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250109_215859_432280_88205687 
X-CRM114-Status: UNSURE (   7.62  )
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



On 1/10/2025 2:30 AM, Jeff Johnson wrote:
> On 1/9/2025 10:35 AM, Aaradhana Sahu wrote:
>> Factory test mode(FTM) is supported only non-mlo(multi-link operation)
> 
> only *in* non-mlo...?
> 
> and s/-mlo/-MLO/
> 
Sure, will address in the next version.

>> mode. Therefore, disable MLO when driver boots in FTM mode.
>>
>> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.3.1-00173-QCAHKSWPL_SILICONZ-1
>>
>> Signed-off-by: Aaradhana Sahu <quic_aarasahu@quicinc.com>
> 


