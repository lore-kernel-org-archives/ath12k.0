Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E87CD711BA
	for <ath12k@archiver.kernel.org>; Wed, 20 Nov 2024 15:45:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-ID:Subject:References:In-Reply-To:CC:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=r117AJXxnoPPu/w4qMPMNtACUJeYSYGLjlNSEmhTREU=; b=1nj7ctF6iVl3/EgL1iUXWhgrD2
	5/iz4hFL7dBNSQpMHd7SKti2YHGvDcOyfLcTkrSdT80Av0H8XL9/uohHTGu/tytEQXmrDGnxwWR7p
	lkKs046iWVPRc/NVQo5sBf3M1uNSKprx837Lg55MXb0gmAPJcege9qlaYXK723hPd0Stlp0jbAiv9
	FJH+TL7zuS3JAB2yf7HyfhwChaz4usu0DtqAN/Ti97fpzKgbCz4FQb5LwYNzCwl8XCSCGtAX0RBvl
	0kWTW2bBEfRRFQndR/0eIDmEKKGQixRpaky+KCv9wl33qknTQIbYKITZHgrxURp3zm/wsnmvolund
	a7mnosKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tDmtj-0000000FijO-05t9
	for ath12k@archiver.kernel.org;
	Wed, 20 Nov 2024 15:45:43 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tDmtg-0000000Fiig-1jHK
	for ath12k@lists.infradead.org;
	Wed, 20 Nov 2024 15:45:41 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4AKAjp6a004461;
	Wed, 20 Nov 2024 15:45:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	r117AJXxnoPPu/w4qMPMNtACUJeYSYGLjlNSEmhTREU=; b=G06nSMPf6X9I62sZ
	wIG5NcjeHj869gFo87Ftsn6moQA00lkIyQ9oImGTbC5tdcVfbeq6psMy7n+ZcQrT
	hiuf+Jm0jBEDiNgCSl5cdh2UP+3W51O43seNWjlR+kUS+vibXKFRl36klToa/OT9
	Y/uhjMSpP/zm5yw+H3/3PlwSZ+6K0gTwe7dnd9tHg5ojP28jK/qXuePECJvrb4fE
	cS3TKOzDApYJ3PwSFBM6VJAleaqFacmMq4byQLxTd0V9MT8Qt5sFEG6efUHx5dzL
	yCX3ZtyQHQzZqT5Ey3xlg2CVMCnxnfYlszfG68AduoICkDJ4XeEL8bW2rtwz8MKh
	nMOkIg==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 431ea70rd8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 20 Nov 2024 15:45:39 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4AKFjcI5014635
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 20 Nov 2024 15:45:38 GMT
Received: from [169.254.0.1] (10.49.16.6) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 20 Nov
 2024 07:45:38 -0800
From: Jeff Johnson <quic_jjohnson@quicinc.com>
To: <ath12k@lists.infradead.org>,
        Roopni Devanathan
	<quic_rdevanat@quicinc.com>
CC: <linux-wireless@vger.kernel.org>,
        Sidhanta Sahu
	<quic_sidhanta@quicinc.com>
In-Reply-To: <20241105052854.2118987-1-quic_rdevanat@quicinc.com>
References: <20241105052854.2118987-1-quic_rdevanat@quicinc.com>
Subject: Re: [PATCH v2] wifi: ath12k: Support MBSSID Control Frame Stats
Message-ID: <173211753847.1671164.6591948218266274358.b4-ty@quicinc.com>
Date: Wed, 20 Nov 2024 07:45:38 -0800
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.0
X-Originating-IP: [10.49.16.6]
X-ClientProxiedBy: nalasex01c.na.qualcomm.com (10.47.97.35) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: IeDwyHOnGKqKubhrfgv64oJowEJSeV5A
X-Proofpoint-ORIG-GUID: IeDwyHOnGKqKubhrfgv64oJowEJSeV5A
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 adultscore=0
 bulkscore=0 mlxscore=0 suspectscore=0 lowpriorityscore=0 clxscore=1015
 priorityscore=1501 impostorscore=0 malwarescore=0 mlxlogscore=692
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2411200106
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241120_074540_459475_286ECD5F 
X-CRM114-Status: UNSURE (   6.94  )
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


On Tue, 05 Nov 2024 10:58:54 +0530, Roopni Devanathan wrote:
> Add support to request MBSSID control frame stats from firmware
> through HTT stats type 54. These stats give information such as
> basic trigger, BSR trigger, multi-user RTS and uplink MUMIMO
> trigger within and across various BSS.
> 
> Note: WCN7850 firmware version -
> WLAN.HMT.1.0-03427-QCAHMTSWPL_V1.0_V2.0_SILICONZ-1.15378.4 does not
> support HTT stats type 54.
> 
> [...]

Applied, thanks!

[1/1] wifi: ath12k: Support MBSSID Control Frame Stats
      commit: ea58aae8458480d6391c404e62f1a4b30462b9c3

Best regards,
-- 
Jeff Johnson <quic_jjohnson@quicinc.com>


