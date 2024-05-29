Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3824FC25B75
	for <ath12k@archiver.kernel.org>; Wed, 29 May 2024 15:46:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dpUHLt7pwsL8k1WQ8PfR9Rhsdeh7FelLetbONZjvaqY=; b=ckj2tIhRTmU+9vVUuuzVQ7yxuZ
	o3X4N6Eh2lRw8g5r3so/SThaVxDFukECb/WW7XzD+53UBk5qgpC/uVO1D+c5ZvHuRB0yNl/XN49rO
	FfMSLHDkZPavMIGSgfM7LmjtF25vyeiHrVXZqw/6gvs73NZleaOfc2gAyi7kmcEqCnnOQXnoBan7O
	hivHKp4SdpA+L6dDvymJbLtA0SvSifrL8vqEtQEqSk0FYnKsPdmygIBQo7wAmFEC8/OrGyhTw2sR0
	y0+TbTt880lS+4wBpQr/VqXkJYDQhStr5TbFLdtneW9TqNTx16k26iWFdVNtZK9AcoTxprWDFZNKP
	i4cKzQVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sCLVK-00000004ktO-3RZw
	for ath12k@archiver.kernel.org;
	Wed, 29 May 2024 15:46:18 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sCLVH-00000004ksH-3Joc
	for ath12k@lists.infradead.org;
	Wed, 29 May 2024 15:46:17 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 44TA0lUn019268;
	Wed, 29 May 2024 15:46:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	dpUHLt7pwsL8k1WQ8PfR9Rhsdeh7FelLetbONZjvaqY=; b=TCdBEY0DQrNpPyO2
	imiVOupktCYoaYKtkmGhgCcdK+eOA1YNiOwzx6tZU9YxICJ6gdWmtquEmx4bqGeC
	00NXWy6TFk+8UsjhLW/BbN6kgF+IKtfC+J060tfZBJRqq5uFoewP2KJVBB0FodBF
	8YRh4jNmiBtuZ6fWnVBzRk3Wulaj0MVIRaxdwNSWT7qntfVDjdQrMrq08b7215BY
	CqCcZkEv1xUQ9Vsjlbq0cmqBkMDGwouRCzR4qu3FtzHOg3j1cxmFh2OVWptOE85A
	EIWEL90vRSgNmEVAsSUuIB/4dCEINBmIa75jxFiIJaGHa/T3F45BhKNAuj1oRw6M
	Pcv4+w==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3yba0g9ge2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 29 May 2024 15:46:13 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 44TFk3cg000361
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 29 May 2024 15:46:03 GMT
Received: from [10.110.122.222] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 29 May
 2024 08:46:02 -0700
Message-ID: <161cc065-f51c-4c44-aec4-487a4494ecc1@quicinc.com>
Date: Wed, 29 May 2024 08:46:01 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] wifi: ath12k: do not process consecutive RDDM event
Content-Language: en-US
To: Baochen Qiang <quic_bqiang@quicinc.com>, <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>
References: <20240529015357.9846-1-quic_bqiang@quicinc.com>
From: Jeff Johnson <quic_jjohnson@quicinc.com>
In-Reply-To: <20240529015357.9846-1-quic_bqiang@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: 4zpIVohw5hLlNKVO0ME5J5_nibypd_ir
X-Proofpoint-ORIG-GUID: 4zpIVohw5hLlNKVO0ME5J5_nibypd_ir
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.12.28.16
 definitions=2024-05-29_12,2024-05-28_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 suspectscore=0
 priorityscore=1501 bulkscore=0 phishscore=0 adultscore=0 spamscore=0
 mlxlogscore=715 malwarescore=0 lowpriorityscore=0 clxscore=1015
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2405170001 definitions=main-2405290109
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240529_084616_019969_A46A0AEC 
X-CRM114-Status: GOOD (  10.19  )
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

On 5/28/2024 6:53 PM, Baochen Qiang wrote:
> Currently we do reset for each RDDM event from MHI, however there are
> cases, see below log, that we get two or more consecutive events, and
> it is pointless to do reset for the subsequent ones. What's more, it
> makes reset process more likely to fail.
> 
> [  103.289864] mhi mhi0: System error detected
> [  103.289871] ath12k_pci 0000:03:00.0: mhi notify status reason MHI_CB_EE_RDDM
> [  103.293144] mhi mhi0: System error detected
> [  103.293150] ath12k_pci 0000:03:00.0: mhi notify status reason MHI_CB_EE_RDDM
> 
> Add a check to avoid reset again and again. This is done by tracking previous
> MHI status: if we receive a new RDDM event while the previous event is
> also the same, we treat it as duplicate and ignore it, because normally
> we should at least receive a MHI_CB_EE_MISSION_MODE event between them.
> 
> Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0.c5-00481-QCAHMTSWPL_V1.0_V2.0_SILICONZ-3
> 
> Signed-off-by: Baochen Qiang <quic_bqiang@quicinc.com>
Acked-by: Jeff Johnson <quic_jjohnson@quicinc.com>


