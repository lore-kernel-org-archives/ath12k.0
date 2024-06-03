Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0884C27C50
	for <ath12k@archiver.kernel.org>; Mon,  3 Jun 2024 20:47:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rSqhldWIOXjUJSVi6PvugsUVUev3HfvYjeAu2cTO6Vs=; b=FlNtrlyIByeZfih52TslWNvkbl
	bXtK4PzEqOLB2eHrydH+yS4SDFNKy+TPsBjB9UkBh0YhuMUw4LZQNVr4oyrC1OLhMSa5618azKK0m
	wOicoX0VZZvO1WS+U6/AjAE6RUZffNHu9Gdh2KRD2/7HnS1xpSTjQmtSOfBaXsRkyIIUspRYvsAvH
	FRKRnT2h8UkavURs6GOyWlIiqiB4h7Po+RSyAwGVbzC+Zp1FJBzvHw39yThyQ9G1cSJAdTbWaSMiP
	v1i3t2lVPEHGHNZfu5jbPowlQNr4MmEosXIqN1NLwkBFXHXy6V54wh7DAavKV5TSzUmH427eiHjBP
	uRui9DPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sEEam-00000000K0z-2OCU
	for ath12k@archiver.kernel.org;
	Mon, 03 Jun 2024 20:47:44 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sEEai-00000000K0D-4B6Q;
	Mon, 03 Jun 2024 20:47:42 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4539ZwDE011871;
	Mon, 3 Jun 2024 20:47:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	rSqhldWIOXjUJSVi6PvugsUVUev3HfvYjeAu2cTO6Vs=; b=gZXzoJVBH2xFx0cq
	puVTVMarONnaze6M4g87z0TAmyUAI5Q6QZIcjufDcWWPvrsfNbBI/OqdyrAjpXZP
	RVOW2Oz1VoBV3MYzZganltJx07ARNM8ZR6yMnyifCzTY2UKcSRiIxJC2Yy3y2/VD
	rcV3y414K+8HXPW8OokIJWdy7PaSujwZiBH4GXH+e4p8XCqSGAN8/m/KN4ZJUk5l
	lIg6UP/0mg0o2mZPWV8OzLZyq5hE+u10VtGYWdgZseODfqHwZiuJVxRsnPk7fIhR
	OLn7Na7TB5p+mtUNYoA6rUzOuRP7HH7KW7ACHgC+l6fhVMKHGJ4BYV3GsvBJUYL1
	x7juhw==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3yfw6qmyb5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 03 Jun 2024 20:47:28 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 453KlRhO013369
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 3 Jun 2024 20:47:27 GMT
Received: from [10.48.241.139] (10.49.16.6) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 3 Jun 2024
 13:47:26 -0700
Message-ID: <c6f85ed9-d1bc-4f44-b0c4-74e351798940@quicinc.com>
Date: Mon, 3 Jun 2024 13:47:25 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: New staging repos for ath1*k firmware
Content-Language: en-US
To: <pgupta@hindutool.com>, <kvalo@kernel.org>
CC: <ath10k@lists.infradead.org>, <ath11k@lists.infradead.org>,
        <ath12k@lists.infradead.org>, <linux-wireless@vger.kernel.org>
References: <bac97f31-4a70-4c4c-8179-4ede0b32f869@quicinc.com>
 <878r09gfzv.fsf@kernel.org> <87ed9dn5va.fsf@kernel.org>
 <1717446068.3fam2c8qo0gc0k0g@mailapp03.register.com>
From: Jeff Johnson <quic_jjohnson@quicinc.com>
In-Reply-To: <1717446068.3fam2c8qo0gc0k0g@mailapp03.register.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.49.16.6]
X-ClientProxiedBy: nalasex01b.na.qualcomm.com (10.47.209.197) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: WIlJ8GqBPsm0NhXe0nf5_a2mIfOTK8I1
X-Proofpoint-ORIG-GUID: WIlJ8GqBPsm0NhXe0nf5_a2mIfOTK8I1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.12.28.16
 definitions=2024-06-03_17,2024-05-30_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 bulkscore=0 mlxlogscore=999 clxscore=1015 impostorscore=0 malwarescore=0
 mlxscore=0 adultscore=0 lowpriorityscore=0 suspectscore=0 spamscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2405170001 definitions=main-2406030167
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240603_134741_075684_C574EDAD 
X-CRM114-Status: UNSURE (   9.70  )
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

On 6/3/2024 1:21 PM, pgupta@hindutool.com wrote:
> The manufacturer of my wifi7 modules (Compex) suggested I use the following repository:
> 
> https://github.com/quic/upstream-wifi-fw/tree/main/ath12k-firmware/QCN9274/hw2.0/1.3/WLAN.WBE.1.3-03253-QCAHKSWPL_SILICONZ-1
> 
> Is this part of the ath12k project?  I have seen it online but have not used it.

That (unfortunately misnamed) repository exists only for the benefit of the
QSDK project, which is a fork of OpenWRT. The firmware releases in that
project have only been validated with drivers that are part of the QSDK --
they have not been validated with upstream kernel.org drivers.

Note that the firmware move from Kalle's personal Github account to CodeLinaro
is just one step in what we hope to be a consolidation effort that is also
intended to include firmware from github.com/quic/upstream-wifi-fw as well as
independent projects containing board files.

/jeff

