Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67F53C25B78
	for <ath12k@archiver.kernel.org>; Mon, 13 May 2024 20:52:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eDsc9pk/eydLP0xmnlQiV+qyHnf9r6A0BUULnPs4WPA=; b=UNCnHHesNapegmnlxc0OQcD0oL
	SVbvXftwAPIXIP5OXXPRWIzcaEfRJcPyY3aVHmrqTm3hy07EF860fvwVU81k2I4+knf9+fmukWd/Q
	sTjJhAzme3SD57V5D7pSESRXbX/9ppR/8Y1y/CuKY/hqHON2x4GJ2H7KqMyFLRhBIRYD91rwktLHI
	Gx/EpVuogN+jt7g2bcyIskSxqKSit8vxkb/m1I+eCqNa2yVR2t88Wgf17/AmP1iwyzDvpNX6Lkfdl
	imQmEOOG5gswfzf6+zL7Op6fhePHo5+cYpia9hUTZHmQhgTkmwm1talvMT/wgTZw3BWtx7358jBuF
	FZKf471A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s6ced-0000000EAkg-07On
	for ath12k@archiver.kernel.org;
	Mon, 13 May 2024 20:52:15 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s6ceZ-0000000EAjw-4AWi
	for ath12k@lists.infradead.org;
	Mon, 13 May 2024 20:52:13 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 44DJ8rUc001193;
	Mon, 13 May 2024 20:52:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	message-id:date:mime-version:subject:to:cc:references:from
	:in-reply-to:content-type:content-transfer-encoding; s=
	qcppdkim1; bh=eDsc9pk/eydLP0xmnlQiV+qyHnf9r6A0BUULnPs4WPA=; b=Y8
	8OngXyjBTUSKmM167nhtxePA9Kbm9Kj0qnaSNbxOaLmWlmPE/EgP7L9OSFuxS+Ej
	n18wXSghF7YHoGc50BaAjWCAQaJE9AeS2m2QjujkV/aTIxL41QJM7guA9diyKFCU
	BU3jCj/b+TOJwUkkTBJ/qhR/e0T8/aOBzqOFcipZ+tO34z6+ttl7eiUEWXlz/cQU
	co6wg3vDuSAhZi+FWOuV2jKq8qJ3rTeYqJkYjzgTrat694v0G6D9+kVRUvw9edib
	FGyN/qcw7JJ+TpZ9JcqVyMEtfYRYIk7Mjij1BCypOdHWcK5pXyzxiR204Lla3SKw
	/Qs+/7cuY9Yb7lh5ci9Q==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3y1y9kvksx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 13 May 2024 20:52:11 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 44DKqAS4023027
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 13 May 2024 20:52:10 GMT
Received: from [10.110.0.4] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 13 May
 2024 13:52:09 -0700
Message-ID: <8d154a30-888e-4e9e-afb3-d5ec27223e67@quicinc.com>
Date: Mon, 13 May 2024 13:52:09 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V4 06/10] wifi: ath12k: fix TX and RX MCS rate
 configurations in HE mode
Content-Language: en-US
To: Pradeep Kumar Chitrapu <quic_pradeepc@quicinc.com>,
        <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>
References: <20240508002055.17705-1-quic_pradeepc@quicinc.com>
 <20240508002055.17705-7-quic_pradeepc@quicinc.com>
From: Jeff Johnson <quic_jjohnson@quicinc.com>
In-Reply-To: <20240508002055.17705-7-quic_pradeepc@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: gCAKaN9GYE3ndntZ4TNkyPu3zXCCy5kc
X-Proofpoint-GUID: gCAKaN9GYE3ndntZ4TNkyPu3zXCCy5kc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.11.176.26
 definitions=2024-05-13_14,2024-05-10_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0
 priorityscore=1501 malwarescore=0 phishscore=0 mlxscore=0 suspectscore=0
 spamscore=0 clxscore=1015 impostorscore=0 adultscore=0 lowpriorityscore=0
 mlxlogscore=938 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2405010000 definitions=main-2405130143
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240513_135212_161352_9399D3DE 
X-CRM114-Status: UNSURE (   7.74  )
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
> Currently, the TX and RX MCS rate configurations per peer are
> reversed when sent to the firmware. As a result, RX MCS rates
> are configured for TX, and vice versa. This commit rectifies
> the configuration to match what the firmware expects.
> 
> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.0.1-00029-QCAHKSWPL_SILICONZ-1
> 
> Fixes: d889913205cf ("wifi: ath12k: driver for Qualcomm Wi-Fi 7 devices")
> Signed-off-by: Pradeep Kumar Chitrapu <quic_pradeepc@quicinc.com>
Acked-by: Jeff Johnson <quic_jjohnson@quicinc.com>


