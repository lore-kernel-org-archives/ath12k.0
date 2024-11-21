Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8548DD7879A
	for <ath12k@archiver.kernel.org>; Thu, 21 Nov 2024 17:01:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WOsQw/isK5Gq94pZWcM8QifvJN+tvzJYJuNI1tyaojs=; b=2eoy7ZR1ncORJNsGdm66gI4KpJ
	kzeGZVXrd/paW4HPpZOe780uw4JN+txSVwG7Z7YThAtZIu8DEXk2Hk2w+IKOvjweSHRNw26+hAy5B
	4sutLMtz1+ADJk5hkCRDMdqfeTJ65eQgSVmbw1KZSA9Mzeuv4EQRYaePfnAgyetxv9QKd8NtFlNHx
	417gVu1MfjJLbMrVrHC5PvqumP2z9o+fM9KNtMKyir6usBiYh2qo1hnocIQX0k57TGg9cU6x9rxVG
	IoNClhiom1uut/hAy03b0Ew4gZHVImWz4XSec66rhsQLJvmzQqLbuEANDpoRB3Ohyj1DkjKoc9/lI
	UAzWF+5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tEAYr-00000000VG6-1GzM
	for ath12k@archiver.kernel.org;
	Thu, 21 Nov 2024 17:01:45 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tEAYo-00000000VFU-3kJ3
	for ath12k@lists.infradead.org;
	Thu, 21 Nov 2024 17:01:44 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4ALGcE8D020888;
	Thu, 21 Nov 2024 17:01:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	WOsQw/isK5Gq94pZWcM8QifvJN+tvzJYJuNI1tyaojs=; b=f2AHhKKvR0o7V/zL
	jo6P3fYcGFeAXrzmCutezOpVrTcTT7EGsSv/E0kHcqxKKlfMaHveGejrhU1NoFYp
	y4aRNuDGcHATdQyd/ZuBcviMTApGxWqg/bMN0OuBHXlLpYSiq/zAwJIkiNsrmsvC
	5L1YscTe/vj56/ljlTUWBMP42Ehaqa6z19MbsI0uC6/iYmk3zRczk/C7vnief44u
	gppNiENJ93D7PBdIUYxSarNGpAHBnPcIKPOKAYbcMV7yPfGxYiT3N1+hJZ4XNt8f
	53VQrjDvIVPi2tHLGAasblq1jqAXLvXB1KOCNFbvq2ULRXC77yF8up81MvI8xK53
	BvATtw==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4320wk1ju3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 21 Nov 2024 17:01:35 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4ALH1X2o030685
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 21 Nov 2024 17:01:34 GMT
Received: from [10.111.176.168] (10.49.16.6) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Thu, 21 Nov
 2024 09:01:33 -0800
Message-ID: <43157125-9cc4-4312-8005-05bcc670b89c@quicinc.com>
Date: Thu, 21 Nov 2024 09:01:32 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/8] [0/8] wifi: ath12k: MLO support part 3
To: Kalle Valo <kvalo@kernel.org>, <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>
References: <20241121155806.1862733-1-kvalo@kernel.org>
From: Jeff Johnson <quic_jjohnson@quicinc.com>
Content-Language: en-US
In-Reply-To: <20241121155806.1862733-1-kvalo@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.49.16.6]
X-ClientProxiedBy: nalasex01b.na.qualcomm.com (10.47.209.197) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: t3eftc6TwQCIuQFVnqZt9gNUT69AdjoH
X-Proofpoint-GUID: t3eftc6TwQCIuQFVnqZt9gNUT69AdjoH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 impostorscore=0
 malwarescore=0 lowpriorityscore=0 suspectscore=0 mlxlogscore=843
 adultscore=0 mlxscore=0 bulkscore=0 clxscore=1015 priorityscore=1501
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2411210129
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241121_090143_049290_703645E5 
X-CRM114-Status: UNSURE (   7.22  )
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

On 11/21/2024 7:57 AM, Kalle Valo wrote:
> From: Kalle Valo <quic_kvalo@quicinc.com>
> 
> We continue refactoring ath12k in preparation for supporting Multi-Link
> Operation. For example, in this patchset we modify station state handling and
> start to use more link level configuration.
> 
> Please review.
> 
> v2:

FYI "v2" wasn't captured in the subject, but please don't resend due to this :)


