Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 328A0C61D97
	for <ath12k@archiver.kernel.org>; Wed, 22 Nov 2023 16:31:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LscLOWV+f8wmLRYR6Trnw5rOtw20ykyNAQaaazbFyH4=; b=MofLbP9AO4z5ZL
	9bHXc0ZF7wqMuZTvPu+Ot6G4u6omBsl8F4ayM7Ds5MeKFRBP2flGuuOYuZ9NxH31C8uWQdLJ3yoSi
	Df22dZK9qI8EzSlvKqt8h9izE4xcMDbdzMFqBTFBhGuEXtfQjZ5YeVQXu0RfD8ClmEtcMlAwtnNXe
	3xLlWks4tyfjjgdWasDE29i60SfNvQkmHcrowhJaXkIwb2zo93GiMWCYux2jF1RJmCF6IMqPyE2xR
	CAeR8fMeL6Ejg8xElTIWs84F5/qom/uYqu1gXc0XZzOQoMxStPsszX1Lv0+nYYcOaW+BiYO0D8Q2W
	Y8Qrd+j9G6LRMlr7TRxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r5q8g-002ThH-2v
	for ath12k@archiver.kernel.org;
	Wed, 22 Nov 2023 16:31:46 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r5q8e-002Tee-2R
	for ath12k@lists.infradead.org;
	Wed, 22 Nov 2023 16:31:46 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3AMFMg9p028197;
	Wed, 22 Nov 2023 16:31:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=3qKGTKEG3vpRSY/X+OWKlV9k9tcTOuDpGev3LADmhKg=;
 b=UNbOb4dnHc7EtW5VaQOr/maPeDZo+gwCTpiQId1rEyNXlALfuk9Rrvl0qBg0rmc3eJax
 PBmlds9XYAqVPsJaKECV9JJGjoRtis9skivm93KH6Ws4WadgOhp4PxgHwXnVAmO5GDsu
 X0FfGigIfTyF2Ch8+FFqEMLE+52L8ZnA2EG3kHtaqcGc57TskMZ8dXtsMQR49kfbAP6T
 cpgnUVmNllr829dU6Vu+Ol8897N6qBQeQNf7A0kh5jlrZBs6uLG+IyT2d/xk1I+2Eo9+
 eBFkGxNgppwc6TgEhK/AMH+1HIZpFCLh/8h/q78SU1bKGLx8njnROEZwYWYp9kCxvYpo 1Q== 
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3ugvt2ktvx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 22 Nov 2023 16:31:40 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 3AMGVdxS012725
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 22 Nov 2023 16:31:39 GMT
Received: from [10.110.116.223] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Wed, 22 Nov
 2023 08:31:39 -0800
Message-ID: <318854e2-fae5-49a1-a71a-0005fe270573@quicinc.com>
Date: Wed, 22 Nov 2023 08:31:38 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] wifi: ath12k: Remove unsupported tx monitor handling
Content-Language: en-US
To: Tamizh Chelvam Raja <quic_tamizhr@quicinc.com>,
        <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>
References: <20231122063932.10321-1-quic_tamizhr@quicinc.com>
 <20231122063932.10321-3-quic_tamizhr@quicinc.com>
From: Jeff Johnson <quic_jjohnson@quicinc.com>
In-Reply-To: <20231122063932.10321-3-quic_tamizhr@quicinc.com>
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: ouzWQoZQfhAmab7zCaF9jKa1jPosH3FC
X-Proofpoint-ORIG-GUID: ouzWQoZQfhAmab7zCaF9jKa1jPosH3FC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-22_12,2023-11-22_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015
 priorityscore=1501 lowpriorityscore=0 adultscore=0 malwarescore=0
 suspectscore=0 bulkscore=0 mlxscore=0 spamscore=0 phishscore=0
 impostorscore=0 mlxlogscore=867 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2311060000 definitions=main-2311220119
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231122_083144_798643_F137A6E5 
X-CRM114-Status: UNSURE (   8.72  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "ath12k" <ath12k-bounces@lists.infradead.org>
Errors-To: ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org

On 11/21/2023 10:39 PM, Tamizh Chelvam Raja wrote:
> Currently tx monitor is not supported in driver. So remove
> the tx monitor ring configuration, allocation and handling.
> 
> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.0.1-00029-QCAHKSWPL_SILICONZ-1
> 
> Signed-off-by: Tamizh Chelvam Raja <quic_tamizhr@quicinc.com>
Acked-by: Jeff Johnson <quic_jjohnson@quicinc.com>


-- 
ath12k mailing list
ath12k@lists.infradead.org
https://lists.infradead.org/mailman/listinfo/ath12k
