Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4146EC5478C
	for <ath12k@archiver.kernel.org>; Mon, 26 Feb 2024 18:32:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JnOAbjexxUo3R2JW/1Pwbl6JMp5lwle0MIUPjo/OrYA=; b=AADuRtiQhnOu5u87V67ZOJ/flU
	Wyz79afpsqrMHQ/gg8mWT3cMQ4RYJEJP1C7z4e0w7MmI64a90yUd4W0Nya6PoKhHp3/l+eJz8Q3BI
	rUzcQUGkXDOQinCW2TxHW+I72XxzrEOndkA59vnRJMUGgZ4G8zsIXwKTbEbdVm4imEyBi0+3SXy3e
	KaqVj1NyeoS1tOM8L2mHkW9VYXY4bCZykkQ9V5zz8sFYAMRuBdMFq7KMSJrqEZtEwQhxVFz9BAoLk
	5Fq8dYEfDg38Q6OyPrA8f25s5DTMS706VTCqVzHt2/o6TCL0rYJ9XIkRV2rxE1T9U8GFiGSwpWXwz
	Hmzi1e2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1reflw-00000002C0P-0tQt
	for ath12k@archiver.kernel.org;
	Mon, 26 Feb 2024 18:32:18 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1reflt-00000002BwP-1C6Q
	for ath12k@lists.infradead.org;
	Mon, 26 Feb 2024 18:32:15 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 41QF8Fcm015470;
	Mon, 26 Feb 2024 18:31:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	message-id:date:mime-version:subject:to:cc:references:from
	:in-reply-to:content-type:content-transfer-encoding; s=
	qcppdkim1; bh=JnOAbjexxUo3R2JW/1Pwbl6JMp5lwle0MIUPjo/OrYA=; b=YM
	n4dnznX4mt9LrQD98w6T3iLnBYWUzePaN3z/kZRRLBc6YR8UhDRey/hgQ9tf3Nve
	+NOUrr5+L2qhafTwDHV0r9ed6OWD4odj1LPBuM6XZwPkx5MgZM2KYgM69h8nfw5+
	7HXvkams79dcuvT372LUGwH/0muYtoEYtlnRBM0msoLcvSX00383YI4cGmLctGsw
	NgAch571HgILXPCxaN7fznIwEoSSzKLrqM7K+DBn2DTb7vtPJeR6QS7jQX7iaACa
	BUy7ekIPFV0SZoxUT9ql5iVgFjSkoHkpQTmbuPoEMbGVrmYf2sDyFOzmEL4dqjJh
	JXCyLpy2E+0C2khtoPtA==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3wgkxm1rqa-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 26 Feb 2024 18:31:49 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 41QIVmQh009331
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 26 Feb 2024 18:31:48 GMT
Received: from [10.227.110.203] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Mon, 26 Feb
 2024 10:31:48 -0800
Message-ID: <c1d327a4-902f-4cfa-9688-30f240b3d268@quicinc.com>
Date: Mon, 26 Feb 2024 10:31:47 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] wifi: ath12k: fix license in p2p.c and p2p.h
Content-Language: en-US
To: Kalle Valo <kvalo@kernel.org>, <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>
References: <20240226180745.3195805-1-kvalo@kernel.org>
From: Jeff Johnson <quic_jjohnson@quicinc.com>
In-Reply-To: <20240226180745.3195805-1-kvalo@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: rIDAhJukPRw1vo2-mthV8r8kAMFazAsS
X-Proofpoint-GUID: rIDAhJukPRw1vo2-mthV8r8kAMFazAsS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-02-26_11,2024-02-26_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 bulkscore=0
 mlxlogscore=651 clxscore=1015 impostorscore=0 suspectscore=0
 priorityscore=1501 lowpriorityscore=0 mlxscore=0 spamscore=0 adultscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2402120000 definitions=main-2402260140
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240226_103213_563492_D2E4B94D 
X-CRM114-Status: UNSURE (   5.69  )
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

On 2/26/2024 10:07 AM, Kalle Valo wrote:
> From: Kalle Valo <quic_kvalo@quicinc.com>
> 
> ath12k uses BSD-3-Clause-Clear, not ISC.
> 
> Signed-off-by: Kalle Valo <quic_kvalo@quicinc.com>
Acked-by: Jeff Johnson <quic_jjohnson@quicinc.com>


