Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56B55CD1292
	for <ath12k@archiver.kernel.org>; Thu,  4 Apr 2024 15:43:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XzUKJ+Hn8Ux1niJRQ/AsBQ4v3JQrU2RMU9q9X+xWbQk=; b=4Q5Q5pPW3EmVarBUTNOs4nYTaI
	DWistG30GptiKUkeLJKtWVyubsEQckW0uyDFeS8K1QQ82f5+RDtlIuCsr9s8YJ39ItBY1btyEZV6N
	I1wWtknx7Ottbg+obSuBDL0EXKEJmZ5hmgA80QxaDC5tlro6Xl7tNBxIIFCrj1965yeTwfEL76heL
	WhRHAesAQIGP1rTuo39nlHtzwnwQuOsvLLV7fAoIv9InOgWw2qBOtKeleR5VBcywaH0naQaVvZOOy
	/YDjrg5wlPAEfNg8SiqGYtgXGACx3m4WMieq4TcpQhRZC7jHbyW5hwuzIAYGXJ5JgoxPKrht2Gf43
	LVNirpGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rsPFU-00000003Hpd-05hy
	for ath12k@archiver.kernel.org;
	Thu, 04 Apr 2024 15:43:32 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rsPFP-00000003Hoj-20mv
	for ath12k@lists.infradead.org;
	Thu, 04 Apr 2024 15:43:30 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 434BUPHI017241;
	Thu, 4 Apr 2024 15:43:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	message-id:date:mime-version:subject:to:cc:references:from
	:in-reply-to:content-type:content-transfer-encoding; s=
	qcppdkim1; bh=XzUKJ+Hn8Ux1niJRQ/AsBQ4v3JQrU2RMU9q9X+xWbQk=; b=Pz
	ki+MiMNcfE1SXh5HUYp9uX3+F2K05bjMhXdD+WQRIk9g3AR10A+SFu8BCS4BBrIW
	kUZL4MWhBEMQ5CvJqKcsGmQzocuh6Pcn0tg3weOoXp3U0CkJ3ChKq+EYEK5oL12l
	8K4T58g6nH11GxGQu6qPPONfEdy2PSA/nJO0o2Cad77BfmyQPv6zOoLr94tMIcOU
	Ed9R6VoHJz6ojZpnm6wyzU7Tsqf7pthx0wYRmUXsOzCwHHaTrmgAHclu4XDegvZA
	DiksDbeX1XLj4MRc4TZ5D1Krv30wL/TSt/bhDywH1N+04E+8LJSHNiRHOYPL68JY
	4xQ/EPYY6+2xBGokzePQ==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3x9ep4svjc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 04 Apr 2024 15:43:22 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 434FhLWw032731
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 4 Apr 2024 15:43:21 GMT
Received: from [10.110.127.230] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Thu, 4 Apr 2024
 08:43:20 -0700
Message-ID: <8ebbfc59-720f-4137-8aff-2014c33e7ffd@quicinc.com>
Date: Thu, 4 Apr 2024 08:43:20 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] wifi: ath12k: fix mac id extraction when MSDU
 spillover in rx error path
Content-Language: en-US
To: Nithyanantham Paramasivam <quic_nithp@quicinc.com>,
        <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>,
        Karthikeyan Periyasamy
	<quic_periyasa@quicinc.com>
References: <20240404141538.1277258-1-quic_nithp@quicinc.com>
From: Jeff Johnson <quic_jjohnson@quicinc.com>
In-Reply-To: <20240404141538.1277258-1-quic_nithp@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: w_KQNaRISUiS8RmYEBe_37IDe96AYAxp
X-Proofpoint-GUID: w_KQNaRISUiS8RmYEBe_37IDe96AYAxp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-04-04_11,2024-04-04_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 malwarescore=0
 bulkscore=0 impostorscore=0 clxscore=1015 spamscore=0 mlxscore=0
 priorityscore=1501 lowpriorityscore=0 suspectscore=0 adultscore=0
 mlxlogscore=272 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2404010003 definitions=main-2404040109
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240404_084327_691206_CE72DC23 
X-CRM114-Status: GOOD (  12.30  )
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

On 4/4/2024 7:15 AM, Nithyanantham Paramasivam wrote:
> From: Karthikeyan Periyasamy <quic_periyasa@quicinc.com>
> 
> Currently, in the rx error data path, mac id is extracted from the
> last 64bits of MSDU end description tag for each entry received in
> the WBM error ring. Then, each entry will be updated into the MSDU
> list for further processing. The extracted mac id is valid when a
> single MSDU is not fragmented and received in the WBM error ring.
> 
> In scenarios where the size of a single MSDU received exceeds the
> descriptor buffer size, resulting in fragmented or spillover MSDU
> entries into the WBM error ring. In this case, the extracted mac id
> from each spillover entry is invalid except the last spillover entry
> of the MSDU. This invalid mac id leads to packet rejection.
> 
> To address this issue, check if the MSDU continuation flag is set,
> then extract the valid mac id from the last spillover entry.
> Propagate the valid mac id to all the spillover entries of the single
> MSDU in the temporary MSDU list(scatter_msdu_list). Then, update this
> into the MSDU list (msdu_list) for further processing.
> 
> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.0.1-00029-QCAHKSWPL_SILICONZ-1
> 
> Signed-off-by: Karthikeyan Periyasamy <quic_periyasa@quicinc.com>
> Signed-off-by: Nithyanantham Paramasivam <quic_nithp@quicinc.com>
Acked-by: Jeff Johnson <quic_jjohnson@quicinc.com>


