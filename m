Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13415C25B75
	for <ath12k@archiver.kernel.org>; Mon, 13 May 2024 20:50:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CG6OjxHMKQsacas43TK3OUHYUbl+qPp4YClO+pTKNyk=; b=SE4wFrWEi1EbykirqfE/Q248BR
	HTtc6lCdnx8mfS367iKO+BrrXnKBkW8WVgQQQeaonRcti0u8SmRpo6xR6O0HByBOeKvqkLLijW/6p
	mjjMt6162uTGWJ2UlO/PglFBhPvs4UkarCorHDy9UNAfzK1VKj2nqC23Rw7f4hFpG3jsPmx5DQ2mS
	WeBx8P4WxZGOX0cu1CjrmqAr/ozUKSHE6M5wZkQAxUnhozCwuSHyGQN1lOj594PhIx0w54oyLQaUh
	uhqKZ8itlgNLsrGleCdE7rvpXLAvm3M14E1+H/GWznrSZrH07yDzLCvM2HWvOowPDaspxUlNvZEeF
	F9+urEwg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s6cca-0000000EAEj-2aUH
	for ath12k@archiver.kernel.org;
	Mon, 13 May 2024 20:50:08 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s6ccY-0000000EACw-0qRr
	for ath12k@lists.infradead.org;
	Mon, 13 May 2024 20:50:07 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 44DJ8awW017405;
	Mon, 13 May 2024 20:50:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	message-id:date:mime-version:subject:to:cc:references:from
	:in-reply-to:content-type:content-transfer-encoding; s=
	qcppdkim1; bh=CG6OjxHMKQsacas43TK3OUHYUbl+qPp4YClO+pTKNyk=; b=FW
	q4loNUWjcqRz5y6LGjhJg61vM0HDMe5kHjPPxW8it1SeQD6jm5Ia1TxgkMbHOWXd
	MferkEXxY0XqP9WHmRMpMw2XkfXFFwBndxjJ/uqkgLDHdoRtQ9+mz/e6Zh57daex
	9LeF5r2SlbZ9hf9fofwVPs4xzP6fimcIM2JaHt0wQ7yDl8GO2yXvmN7mibPshaII
	oviwSGI6sXry4M2NQXr7M0yrAOdwYd8C26OKcDEsbt5iYGe2ClusD6RB06ty8fWg
	/P+AyE3tcaCFDhYdTIGjjKlxVhtXAi5pV18QFpHgOBbOOf61D3vW3p1ZzjXDSFn2
	nTLVPdKsFJiv877Fr/aw==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3y20w1vgkn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 13 May 2024 20:50:01 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 44DKo1Xh018838
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 13 May 2024 20:50:01 GMT
Received: from [10.110.0.4] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 13 May
 2024 13:50:00 -0700
Message-ID: <bc642638-288b-459a-8713-bda307b653e2@quicinc.com>
Date: Mon, 13 May 2024 13:50:00 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V4 02/10] wifi: ath12k: push HE MU-MIMO params to hardware
Content-Language: en-US
To: Pradeep Kumar Chitrapu <quic_pradeepc@quicinc.com>,
        <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>, Muna Sinada <quic_msinada@quicinc.com>
References: <20240508002055.17705-1-quic_pradeepc@quicinc.com>
 <20240508002055.17705-3-quic_pradeepc@quicinc.com>
From: Jeff Johnson <quic_jjohnson@quicinc.com>
In-Reply-To: <20240508002055.17705-3-quic_pradeepc@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: fcrshODCnZZzzR3QZ8h5cpwN2Az7iQUq
X-Proofpoint-GUID: fcrshODCnZZzzR3QZ8h5cpwN2Az7iQUq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.11.176.26
 definitions=2024-05-13_14,2024-05-10_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0
 mlxlogscore=823 mlxscore=0 phishscore=0 adultscore=0 suspectscore=0
 clxscore=1015 priorityscore=1501 bulkscore=0 spamscore=0
 lowpriorityscore=0 impostorscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2405010000 definitions=main-2405130143
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240513_135006_389806_C28CD120 
X-CRM114-Status: UNSURE (   7.71  )
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
> Currently, only the HE IE in management frames is updated with
> respect to MU-MIMO configurations, but this change is not
> reflected in the hardware. Add support to propagate MU-MIMO
> configurations to the hardware as well.
> 
> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.0.1-00029-QCAHKSWPL_SILICONZ-1
> 
> Co-developed-by: Muna Sinada <quic_msinada@quicinc.com>
> Signed-off-by: Muna Sinada <quic_msinada@quicinc.com>
> Signed-off-by: Pradeep Kumar Chitrapu <quic_pradeepc@quicinc.com>
Acked-by: Jeff Johnson <quic_jjohnson@quicinc.com>



