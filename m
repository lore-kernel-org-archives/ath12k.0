Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F72CD2A520
	for <ath12k@archiver.kernel.org>; Wed, 16 Oct 2024 15:19:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-ID:Subject:References:In-Reply-To:CC:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8Xe7EAOMFkg+dIERCK9OdLAf+zsW8AEnoI2Onp2fW1Y=; b=T6QXSCACBPKThsMahTrj39iTs7
	o0BcLNXyCpDbrOZpAB6Uvvza6BwS85oqd1N7TIGeNjUYd707FwX4APhyOabicMKaP2HIn1W6rTER6
	94jSQQyUBTr7sICvjiqbwbgasbj6kPopmPbo98nq4tQRWwOQCrRFqu1xUXHZj8oqHt+Rv0CTSNLve
	4ombdz3TrHf2dCOsK/8FP8w729dqX6A6RWQg/bzU2Pl/mgsc5bAdFct/SnQM590cof6w0NIX9kZP0
	PbI3Em3cHMcAiBc8eOQY6gGScMqOx4nfY9akqI1yAeu1KV+dLQY0gA+GOo/dSnNCTA+DosXNUJrqc
	as2RbO8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t15oV-0000000CDpD-1Hh9
	for ath12k@archiver.kernel.org;
	Wed, 16 Oct 2024 15:19:51 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t15mh-0000000CDW0-0rin
	for ath12k@lists.infradead.org;
	Wed, 16 Oct 2024 15:18:00 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49GA0ar4012488;
	Wed, 16 Oct 2024 15:17:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	8Xe7EAOMFkg+dIERCK9OdLAf+zsW8AEnoI2Onp2fW1Y=; b=ISEFQ+BGuilI5bHk
	4GMcSg/Z9dD/O0FHYIY/yR4qf86T42S9+Rs4ToRL08+bO3ILW1IT1L/2H7Z5iN0U
	QoZ7l9n60m7YhDA8FsbKIVBGWd+7RQMCix+WrzE7+tJi3QLphyuq/YBroaGsQxXk
	sGEP3dXaow1oR5Yf8/Nu6VA8x2CnEjtw1t7f/7WRPJ62i6YApFYlFTDAJz7jqgCg
	OizLcmYXgb27avuGI0vHlPa/12xi1FkfGYEFY+oK1NbVQOlJ9BMwtM6HwJmyc61B
	eTDInDZAp5Qj88Rpcijqioli0q5Efkt4ZTZ/kbrKHQbflFpRY8r0OJYgmmVuvoZs
	XHZm+Q==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42abbxs285-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 16 Oct 2024 15:17:58 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 49GFHvd5028667
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 16 Oct 2024 15:17:57 GMT
Received: from [169.254.0.1] (10.49.16.6) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 16 Oct
 2024 08:17:56 -0700
From: Jeff Johnson <quic_jjohnson@quicinc.com>
To: <ath12k@lists.infradead.org>,
        Sowmiya Sree Elavalagan
	<quic_ssreeela@quicinc.com>
CC: <linux-wireless@vger.kernel.org>
In-Reply-To: <20240717085604.4131642-1-quic_ssreeela@quicinc.com>
References: <20240717085604.4131642-1-quic_ssreeela@quicinc.com>
Subject: Re: [PATCH v5] wifi: ath12k: Add firmware coredump collection
 support
Message-ID: <172909187678.412681.572371942538670959.b4-ty@quicinc.com>
Date: Wed, 16 Oct 2024 08:17:56 -0700
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.0
X-Originating-IP: [10.49.16.6]
X-ClientProxiedBy: nalasex01a.na.qualcomm.com (10.47.209.196) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: AxSkbiwMCzzLSiRk7lzYLtPco3n6cErx
X-Proofpoint-GUID: AxSkbiwMCzzLSiRk7lzYLtPco3n6cErx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 clxscore=1015
 priorityscore=1501 impostorscore=0 mlxscore=0 mlxlogscore=453 bulkscore=0
 spamscore=0 malwarescore=0 lowpriorityscore=0 suspectscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2409260000
 definitions=main-2410160095
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241016_081759_438123_24EB6E96 
X-CRM114-Status: UNSURE (   7.89  )
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


On Wed, 17 Jul 2024 14:26:04 +0530, Sowmiya Sree Elavalagan wrote:
> In case of firmware assert snapshot of firmware memory is essential for
> debugging. Add firmware coredump collection support for PCI bus.
> Collect RDDM and firmware paging dumps from MHI and pack them in TLV
> format and also pack various memory shared during QMI phase in separate
> TLVs.  Add necessary header and share the dumps to user space using dev
> coredump framework. Coredump collection is disabled by default and can
> be enabled using menuconfig. Dump collected for a radio is 55 MB
> approximately.
> 
> [...]

Applied, thanks!

[1/1] wifi: ath12k: Add firmware coredump collection support
      commit: a9b46dd2e483bf99fa09e6aeea7701960abaa902

Best regards,
-- 
Jeff Johnson <quic_jjohnson@quicinc.com>


