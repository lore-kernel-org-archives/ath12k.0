Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90E6AC25B10
	for <ath12k@archiver.kernel.org>; Fri, 10 May 2024 19:53:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mxylWuMs6ARut6Y7G3bDTyI6GtLj+TpEJPahYFIO9S8=; b=0EqbJLtRynJSob5HRX9Yq03D3X
	+316MdqBmprTd3JlV89fXIn2Et0G4dk2meedxd/NSUsFjLOemhSM9r4pWZACqxNNRuwXJvWXyL2EB
	1o6ylmUgMwDNH0Ud+a/A2CExWxlon3TFYTnSMRFtk+rlCs81GGx8RUm0cId7z5Wess7NCny8x/iD1
	RIvL76epd+YviO+tjIdL0mb/eUZiC6PXpJzjLwcmJkyqu1fz2ewA2lh3t+QL4amQmiQcNc0pCAdwe
	/5q6kMoPFvOvgFhtEFEcVPstQaZVO3a7tvoOa8TnGrR9+GXQsyxzwibtzCiJlCxIO+eNBHc4wzmjV
	EdPRwVLA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s5WJO-00000006Jjl-1GbK
	for ath12k@archiver.kernel.org;
	Fri, 10 May 2024 19:53:46 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s5WJM-00000006Jj3-1MOK
	for ath12k@lists.infradead.org;
	Fri, 10 May 2024 19:53:45 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 44ADvQhf028312;
	Fri, 10 May 2024 19:53:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	message-id:date:mime-version:subject:to:cc:references:from
	:in-reply-to:content-type:content-transfer-encoding; s=
	qcppdkim1; bh=mxylWuMs6ARut6Y7G3bDTyI6GtLj+TpEJPahYFIO9S8=; b=ZE
	n2T/oHm4qeG3bWkRiMAAlaGLkSViUt03IsPKsVrlfEclnxX/xD+BFhoxjRiLpkS/
	NRRnC9B3bccDSeKjxFq+lIV0TngfwI0dypqqWQUpnPetoRENoQnBQhlrhnBZkG+Q
	aALYh8V28VgjyrJNYpowTYyM61VsMl0zlObd5W6oafq1WMelHxAPrtA4iibc7SLw
	SUZzfZYzsmOs+zlxFLa221NfekDEfCNFjKdV3nwSk4O1twJqNA6gd0XMunSHkRN8
	kmamGNzIMeioKKtxWzcno9DeojVDSUuYJ3b2j+pBGqbf5jzTX733PixVuB113MeN
	aQWn+415gG3vhyR3aBVg==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3y16w0tetx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 10 May 2024 19:53:43 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 44AJrh0N003739
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 10 May 2024 19:53:43 GMT
Received: from [10.110.100.57] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Fri, 10 May
 2024 12:53:42 -0700
Message-ID: <c40cf853-f709-4ccb-ad73-e6d688b14251@quicinc.com>
Date: Fri, 10 May 2024 12:53:42 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/5] wifi: ath12k: Fix Pdev id in HTT stats request for
 WCN7850
Content-Language: en-US
To: Ramya Gnanasekar <quic_rgnanase@quicinc.com>, <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>, Lingbo Kong <quic_lingbok@quicinc.com>
References: <20240510050806.514126-1-quic_rgnanase@quicinc.com>
 <20240510050806.514126-4-quic_rgnanase@quicinc.com>
From: Jeff Johnson <quic_jjohnson@quicinc.com>
In-Reply-To: <20240510050806.514126-4-quic_rgnanase@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: MMQQapn_Np_SPGVk3qhUZcChkSGHEP7x
X-Proofpoint-ORIG-GUID: MMQQapn_Np_SPGVk3qhUZcChkSGHEP7x
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.11.176.26
 definitions=2024-05-10_14,2024-05-10_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501 mlxscore=0
 mlxlogscore=952 clxscore=1015 suspectscore=0 impostorscore=0
 malwarescore=0 lowpriorityscore=0 adultscore=0 bulkscore=0 phishscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2405010000 definitions=main-2405100142
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240510_125344_457698_F9470F76 
X-CRM114-Status: UNSURE (   9.33  )
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

On 5/9/2024 10:08 PM, Ramya Gnanasekar wrote:
> From: Lingbo Kong <quic_lingbok@quicinc.com>
> 
> Pdev id from mac phy capabilities will be sent as a part of
> HTT stats request to firmware. This causes issue with single pdev
> devices where fimrware does not respond to the stats request
> sent from host.
> 
> Single pdev devices firmware expects pdev id as 1 for 5GHz/6GHz
> phy and 2 for 2GHz band. Handle pdev id for single phy device
> while sending HTT stats request message to firmware.
> 
> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.0.1-00029-QCAHKSWPL_SILICONZ-1
> Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0.c5-00481-QCAHMTSWPL_V1.0_V2.0_SILICONZ-3
> 
> Signed-off-by: Lingbo Kong <quic_lingbok@quicinc.com>
> Signed-off-by: Ramya Gnanasekar <quic_rgnanase@quicinc.com>

Acked-by: Jeff Johnson <quic_jjohnson@quicinc.com>


