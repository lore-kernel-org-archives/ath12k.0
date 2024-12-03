Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 798A6E6C61A
	for <ath12k@archiver.kernel.org>; Tue,  3 Dec 2024 09:19:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4FmtQeza1CzHNqrTW/NmGRcEE/2b9bklTjsRtN7+/ds=; b=uEpKBSK7kHW/pyLzZLItn/qUxw
	k2B9Bm22b4BFq8CDI5D1WAemsNl8N/PG/UU3GX+PRXm2EupxRoOyczM3ScQVf9zoWP7Hcwvg4XVRu
	6a23mxodU7UVO7RULv7TnCjkcxxqvXIFXTVgfUqXvte4sgDl6XLpASyDLjTtwC0X6Y1LNCbYZAIug
	4pBlSJC/ResTfTmf+haVepFm3kv0ZW8Lvb4iZ8eI/4xE9f+OU3huYBKZhOHptxQfUnQZLPwZpeQg1
	1bnuXwFdo2E92+KICvENKpaiKsaOkADlKb/rWzvpIJ4xnuC4gaIcBNraOpzTlmDGXQAIyYLgZytNb
	VcA6qRQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tIP3r-00000008qed-0laS
	for ath12k@archiver.kernel.org;
	Tue, 03 Dec 2024 09:19:15 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tIP3o-00000008qeA-2jfG
	for ath12k@lists.infradead.org;
	Tue, 03 Dec 2024 09:19:13 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4B38O3YD028930;
	Tue, 3 Dec 2024 09:19:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4FmtQeza1CzHNqrTW/NmGRcEE/2b9bklTjsRtN7+/ds=; b=j/ZyoZ3wwk69T1oX
	I+VmYIq1lpIxXpbAuFsg+MPHzSgrKr/lfrpS+ubkueH66xhY8WFt+b/Vv7UuXsbj
	g0G4q8MI1Sef1BhtPuNKZ3BkmYgYbQvBNdsjxoEat/ftcNpELSEuYgaao3PYGsvq
	pjzTCmOa6HmXWHeyjhP6r7kmrowC2VX7lDfOd1uUQbpKVIdHdG3EaaSnMU3Yw7d8
	EdNvAFXp1v6ra5JqfwJ6U2nbP0zhL4Gy4tZtoTbP21wUM2nDBkiRd8ZDTlAxgEEd
	KJd7TWCi1tJUOT6bWD34URQ7UGcRWjN7N/33BmKymETbbd9hF0hV53SwKJ7VAqqD
	smkpvg==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 437tstfk69-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 03 Dec 2024 09:19:06 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4B39J5Ze021551
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 3 Dec 2024 09:19:05 GMT
Received: from [10.151.41.184] (10.80.80.8) by nalasex01b.na.qualcomm.com
 (10.47.209.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 3 Dec 2024
 01:19:01 -0800
Message-ID: <0796510c-20bd-4a81-bd60-40aacbcf61c0@quicinc.com>
Date: Tue, 3 Dec 2024 14:48:58 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 15/22] wifi: ath12k: add BDF address in hardware
 parameter
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>, Kalle Valo <kvalo@kernel.org>,
        "Rob
 Herring" <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        "Conor
 Dooley" <conor+dt@kernel.org>,
        Jeff Johnson <jjohnson@kernel.org>,
        "Bjorn
 Andersson" <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>
References: <20241015182637.955753-1-quic_rajkbhag@quicinc.com>
 <20241015182637.955753-16-quic_rajkbhag@quicinc.com>
 <142f92d7-72e1-433b-948d-2c7e7d37ecfc@oss.qualcomm.com>
Content-Language: en-US
From: Raj Kumar Bhagat <quic_rajkbhag@quicinc.com>
In-Reply-To: <142f92d7-72e1-433b-948d-2c7e7d37ecfc@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: 2sj9l3bAucBR50kKxPni91PBON0uv-o0
X-Proofpoint-GUID: 2sj9l3bAucBR50kKxPni91PBON0uv-o0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 malwarescore=0 spamscore=0 impostorscore=0 mlxlogscore=999 mlxscore=0
 priorityscore=1501 suspectscore=0 phishscore=0 adultscore=0 clxscore=1015
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412030079
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241203_011912_809245_3AE809D5 
X-CRM114-Status: GOOD (  10.90  )
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

On 11/4/2024 7:46 PM, Konrad Dybcio wrote:
> On 15.10.2024 8:26 PM, Raj Kumar Bhagat wrote:
>> The Ath2k AHB device (IPQ5332) firmware requests BDF_MEM_REGION_TYPE
>> memory during QMI memory requests. This memory is part of the
>> HOST_DDR_REGION_TYPE. Therefore, add the BDF memory address to the
>> hardware parameter and provide this memory address to the firmware
>> during QMI memory requests.
> 
> Sounds like something to put in the device tree, no?
> 

This BDF memory address is the RAM offset. We did add this in device tree in
version 1. This is removed from device tree in v2 based on the review comment that
DT should not store RAM offset.

refer below link:
Link: https://lore.kernel.org/all/f8cd9c3d-47e1-4709-9334-78e4790acef0@kernel.org/

