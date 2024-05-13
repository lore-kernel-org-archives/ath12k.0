Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 704D2C25B10
	for <ath12k@archiver.kernel.org>; Mon, 13 May 2024 20:50:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rwxgJ7hH6nUNQAAX+fiFfxdP69xhCHORfAhQDTmzVuA=; b=Bo+IPoq0gjEcHXxjLuz3h2H8sa
	Ue6Z4ZsUYOaS/OndmdjEVCfd15v6oVY9KZJGVXkUcag/OtKv6HeFs3mgi2MHMDEYPGTkdSlxunZ5l
	91tVyV5GVDffuyYzYV5AeErv4bHSNBDVm/qxo92+uyjTGp14pX4OTR2Dvv0uA3VBRmcS+/XPjiVf7
	gjNi8DQAMVwRLdGECSOFs7EcDpH5YT0bGwGm+D2bz+WM0KEa4cXbdug10AKO/2v+idiCf7ROh85dj
	Z1zCfmP3FkdWz0WgRrTy/FgekfsbJAybCEpWUQBEzTyY5buVUxJvxPmFdV9TeJDYp2VEm99MiXUTx
	dueTaa/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s6ccv-0000000EAHZ-3O8e
	for ath12k@archiver.kernel.org;
	Mon, 13 May 2024 20:50:30 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s6ccs-0000000EAGx-2jZN
	for ath12k@lists.infradead.org;
	Mon, 13 May 2024 20:50:28 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 44DJ8cQh027283;
	Mon, 13 May 2024 20:50:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	message-id:date:mime-version:subject:to:cc:references:from
	:in-reply-to:content-type:content-transfer-encoding; s=
	qcppdkim1; bh=rwxgJ7hH6nUNQAAX+fiFfxdP69xhCHORfAhQDTmzVuA=; b=bX
	XFh0YroLWTE2EQ8HQ7JgOwXOnVq42ld/bfjP8UZWSo991WEOqDU5whfdv8SuTAl3
	wIcG5NSCnl08x+GvsF2lE5xMVmVIiTI5Wb77xK9hU8WzRm8VxWQKTZUs3/bm8qJe
	cvi3UC0NNpBAkND1j+kVA6TOPOS63ptkJmbpTw1/kw8nqpBW0dhMztStRoPOCJxp
	kdQmp54rZcSMbWsXau7Ud7F69to8ggjHn0Fii95vuOwPsSTzcNhyarKymTQvePXZ
	a7jgrB6WshGiAddsdGphJJtiucrS8hq6YaCN+uwC4V6dYt9tNLemZI7UFR4JTtVz
	a86iat85O2pnuLFhuM3A==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3y208vvh4w-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 13 May 2024 20:50:25 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 44DKoOEO019632
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 13 May 2024 20:50:24 GMT
Received: from [10.110.0.4] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 13 May
 2024 13:50:23 -0700
Message-ID: <eff1f89a-9ff6-4d79-9cb0-1c0058c47115@quicinc.com>
Date: Mon, 13 May 2024 13:50:23 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V4 03/10] wifi: ath12k: push EHT MU-MIMO params to
 hardware
Content-Language: en-US
To: Pradeep Kumar Chitrapu <quic_pradeepc@quicinc.com>,
        <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>, Muna Sinada <quic_msinada@quicinc.com>
References: <20240508002055.17705-1-quic_pradeepc@quicinc.com>
 <20240508002055.17705-4-quic_pradeepc@quicinc.com>
From: Jeff Johnson <quic_jjohnson@quicinc.com>
In-Reply-To: <20240508002055.17705-4-quic_pradeepc@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: DqdctsrbMRdCi46CI41MNF6bCJZNpoHv
X-Proofpoint-GUID: DqdctsrbMRdCi46CI41MNF6bCJZNpoHv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.11.176.26
 definitions=2024-05-13_14,2024-05-10_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 mlxscore=0
 lowpriorityscore=0 phishscore=0 impostorscore=0 mlxlogscore=805
 clxscore=1015 malwarescore=0 suspectscore=0 priorityscore=1501 spamscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2405010000 definitions=main-2405130143
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240513_135026_876913_E69500C4 
X-CRM114-Status: UNSURE (   7.55  )
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
> Currently, only the EHT IE in management frames is updated with
> respect to MU-MIMO configurations, but this change is not
> reflected in the hardware. Add support to propagate MU-MIMO
> configurations to the hardware as well for AP mode. Similar
> support for STA mode will be added in future.
> 
> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.0.1-00029-QCAHKSWPL_SILICONZ-1
> 
> Co-developed-by: Muna Sinada <quic_msinada@quicinc.com>
> Signed-off-by: Muna Sinada <quic_msinada@quicinc.com>
> Signed-off-by: Pradeep Kumar Chitrapu <quic_pradeepc@quicinc.com>
Acked-by: Jeff Johnson <quic_jjohnson@quicinc.com>


