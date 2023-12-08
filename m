Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79A8AC4167B
	for <ath12k@archiver.kernel.org>; Fri,  8 Dec 2023 00:26:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ggEUJ9tHNBwk/WsqVTXvU47jo4Flq0DSmFAEXWpqUnE=; b=avTOS3EK2kD7MNDEdfZiuSJffa
	xrKSOg3MU4eoqkgBIiULpD4Divfqmic5t093TYZ2ASILcVCf1b1PH1IMiJUPmi8cFa3Kt+XxDdDhu
	rBXELfi28UWZ0oV/andqd816IwgJFiCuvlIiObPSSqYFHV6nfWMUfIeK7EnNY8Ep7x93vP96dL6eo
	FfOYVGAIZLKIiKkC66nbYVtbVGxaR1e0ninRSCVvyuVkBKH/Qdj0Aj+GHve5WlIb+njqwnjJzMt2a
	SadoS8znZ7T8/nuO9bs2DI7KFzHMPfbL5na0a47pwpDSERA6cIDAHrPoOEjgeE11+fUquiE97Qizg
	RygVtGXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rBOh4-00EJjD-0i
	for ath12k@archiver.kernel.org;
	Fri, 08 Dec 2023 00:26:14 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rBOh1-00EJio-1D
	for ath12k@lists.infradead.org;
	Fri, 08 Dec 2023 00:26:12 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3B7MOugV012768;
	Fri, 8 Dec 2023 00:26:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=ggEUJ9tHNBwk/WsqVTXvU47jo4Flq0DSmFAEXWpqUnE=;
 b=bC8BkIspcD3mzq6Gtq1Qnq2E98WX60VVqJ1kjckhdDqHmaD/alWHXlv23CT6//uU0uip
 TohwYEREbZfaxKxgr+ZaMMF+/Hkrbd/kf/h47CFj8KNYB9HgqAaUSxmdL3FjTKmo1ob4
 mstxsIM8XkhhHLHKHbd2Lo+2KBl+5SJBm77/RiSBfsDllSmrMi99T7gj6DMn1K4sk51m
 HnN+UmTd02hLgbuJqbd3owa6DHqwMZVJdJXqDG+w2raAqa7H6rcNErWrjFKJeyKHdG9e
 OrKc3eJ72yFVqS+JH1510v8zCTwfaExdKmCyZuONpGP1mV50HvqlJfJXl2pNcQ3EEhQ0 +g== 
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3uubd825nu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 08 Dec 2023 00:26:10 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 3B80QAHY026091
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 8 Dec 2023 00:26:10 GMT
Received: from [10.110.111.75] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Thu, 7 Dec
 2023 16:26:09 -0800
Message-ID: <57e90ee4-7b3c-4447-9309-74f7825d03e9@quicinc.com>
Date: Thu, 7 Dec 2023 16:26:08 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] wifi: ath12k: fix the issue that the
 multicast/broadcast indicator is not read correctly for WCN7850
Content-Language: en-US
To: Lingbo Kong <quic_lingbok@quicinc.com>, <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>
References: <20231206141759.5430-1-quic_lingbok@quicinc.com>
From: Jeff Johnson <quic_jjohnson@quicinc.com>
In-Reply-To: <20231206141759.5430-1-quic_lingbok@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: dbkiO9ispMkZCBCvJfybakmRYAdpItAg
X-Proofpoint-ORIG-GUID: dbkiO9ispMkZCBCvJfybakmRYAdpItAg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-12-07_18,2023-12-07_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 clxscore=1015
 suspectscore=0 mlxlogscore=541 impostorscore=0 phishscore=0
 lowpriorityscore=0 adultscore=0 malwarescore=0 mlxscore=0 spamscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2311290000 definitions=main-2312080002
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231207_162611_421494_117B249A 
X-CRM114-Status: UNSURE (   9.96  )
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

On 12/6/2023 6:17 AM, Lingbo Kong wrote:
> We observe some packets are discarded in ieee80211_rx_handlers_result
> function for WCN7850. This is because the way to get multicast/broadcast
> indicator with RX_MSDU_END_INFO5_DA_IS_MCBC & info5 is incorrect. It should
> use RX_MSDU_END_INFO13_MCAST_BCAST & info13 to get multicast/broadcast
> indicator.
> 
> Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0-03427-QCAHMTSWPL_V1.0_V2.0_SILICONZ-1.15378.4
> 
> Signed-off-by: Lingbo Kong <quic_lingbok@quicinc.com>
Acked-by: Jeff Johnson <quic_jjohnson@quicinc.com>


