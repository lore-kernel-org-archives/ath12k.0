Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8029EC25B10
	for <ath12k@archiver.kernel.org>; Mon, 13 May 2024 20:50:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9IBfPhxA1NrVwT7OSIInJXZ0zEe6Cgr+TkUZocMlJDE=; b=pBspVm4SjvvLeakxmirKcLKdEP
	WeI48cGlIx2fmKKhLAjsWkAC4sbl3x9U3pZTAKzszxxS6lEUm4Uwd2rhNJJyAFe6gOhSOZDuBLyCA
	UpMPrYivpKViF683h1cGq1Fpm+QlHXX18BWoYqLQwnCyX+ivVSuqpM45AFwESdHfrd1YJ/XaERYgr
	Fpj5JJHohoNaSmG3vJ0Xi6U+RP59CGiEHvFb8DCc1eaP8ZszG3voN9Lunn6nM3ZJwZ21Dp20zBpOF
	+28W9CdMM1EY6nxzHyQupUqoMzZr5rKz1HmjWOT3+6eFh0nJKcMYbYZ8L6UU4icUKEya27An0BN2W
	NDHWNdmw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s6cdF-0000000EAML-0rJQ
	for ath12k@archiver.kernel.org;
	Mon, 13 May 2024 20:50:49 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s6cdB-0000000EALB-2DVT
	for ath12k@lists.infradead.org;
	Mon, 13 May 2024 20:50:46 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 44DJ8bS7018843;
	Mon, 13 May 2024 20:50:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	message-id:date:mime-version:subject:to:cc:references:from
	:in-reply-to:content-type:content-transfer-encoding; s=
	qcppdkim1; bh=9IBfPhxA1NrVwT7OSIInJXZ0zEe6Cgr+TkUZocMlJDE=; b=OO
	qwVf7A6kENzShqVZCCbbMW9bQCkh0dwouT6dOcml2Z+0LeSCOttFqvx24ErsDB4/
	4ZfcfaESPag7HfE2pJTqymqU+INtZQ3cw1sEzDLvajSe5h9OzaGeOGQ2TQ+ruK29
	0hIVqHRGfpga7vZVhOpQb4Xb+zuVMyzFv26GsYe+x5ehtmfIAxDJ0L9Qc9fsuZhL
	FJJlNuKxPRFCFudJwWd2LrSZ3VcwZu7WKZ+18wVh72GhaHovJRQeUtSjdAH1ct81
	kq3zvZn5sgOFeL8IMGm0RDN/6ybfSA1XH0FSCezaYGgvSKpERHJnJb/Ecl31RuQu
	qWl5ou/R4pfnJxEdwl5A==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3y20rtcgyd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 13 May 2024 20:50:44 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 44DKog3e028364
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 13 May 2024 20:50:42 GMT
Received: from [10.110.0.4] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 13 May
 2024 13:50:41 -0700
Message-ID: <a376d378-ef0f-4d55-a8de-24d3ae40ece1@quicinc.com>
Date: Mon, 13 May 2024 13:50:41 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V4 04/10] wifi: ath12k: move HE MCS mapper to a separate
 function
Content-Language: en-US
To: Pradeep Kumar Chitrapu <quic_pradeepc@quicinc.com>,
        <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>, Muna Sinada <quic_msinada@quicinc.com>
References: <20240508002055.17705-1-quic_pradeepc@quicinc.com>
 <20240508002055.17705-5-quic_pradeepc@quicinc.com>
From: Jeff Johnson <quic_jjohnson@quicinc.com>
In-Reply-To: <20240508002055.17705-5-quic_pradeepc@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: 5H13nZwGpmnT3kxu4UlUje0F5-ATOoMg
X-Proofpoint-GUID: 5H13nZwGpmnT3kxu4UlUje0F5-ATOoMg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.11.176.26
 definitions=2024-05-13_14,2024-05-10_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 suspectscore=0 bulkscore=0 clxscore=1015 mlxscore=0 malwarescore=0
 adultscore=0 spamscore=0 priorityscore=1501 phishscore=0 mlxlogscore=879
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2405010000 definitions=main-2405130143
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240513_135045_850986_8E111CDF 
X-CRM114-Status: UNSURE (   8.14  )
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

On 5/7/2024 5:20 PM, Pradeep Kumar Chitrapu wrote:
> Refactor the HE MCS mapper functionality in
> ath12k_mac_copy_he_cap() into a new function.
> 
> This helps improve readability, extensibility and will be used
> when adding support for 160 MHz bandwidth in subsequent patches.
> 
> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.0.1-00029-QCAHKSWPL_SILICONZ-1
> 
> Co-developed-by: Muna Sinada <quic_msinada@quicinc.com>
> Signed-off-by: Muna Sinada <quic_msinada@quicinc.com>
> Signed-off-by: Pradeep Kumar Chitrapu <quic_pradeepc@quicinc.com>
Acked-by: Jeff Johnson <quic_jjohnson@quicinc.com>


