Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE7E2D2A529
	for <ath12k@archiver.kernel.org>; Wed, 16 Oct 2024 15:19:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-ID:Subject:References:In-Reply-To:CC:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9nDg3GtNfDTM7i61AFxwO1Y2ktiYpG3Ez8Nu3giBiPU=; b=nB2onMnLUNp2+MOrmkcG56NoKc
	zjpVEK2ayodWqIoEFr059+WIWkEQ/zjykn5CbtzxVkcYIXVz5NI7FxTlz6QZlVk/VHTF4SIF+cH/e
	/U7JXEmTXhISr6YYqAsHHRRW+xsLwAK/wz8XmKcr3xJ3XmRl3ZyG9mnofbo/FucoxR4SgAl35dkOR
	6PHm1iVQrw4Nq2ocbGuLNcOeETQdR0yTmV1L1fWjSSUsrVZtcRPh1uN4UzwWQahTIlAPVNecaOnQQ
	ZuOkcRcxjjpnbCj1GCPcTcQ6n7Sds+etBi+nDqjR+JtSQgC5u4Y5gyhFjD/bDpqPH/Xeo0rb2BmIm
	cSsZTL6A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t15oW-0000000CDph-1oF9
	for ath12k@archiver.kernel.org;
	Wed, 16 Oct 2024 15:19:52 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t15ml-0000000CDXZ-0WHm
	for ath12k@lists.infradead.org;
	Wed, 16 Oct 2024 15:18:04 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49G8Q2TT016921;
	Wed, 16 Oct 2024 15:17:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	9nDg3GtNfDTM7i61AFxwO1Y2ktiYpG3Ez8Nu3giBiPU=; b=P8p1ig9xahqA+h+s
	lXUND2GKaRCQ96eBLjqwQSg8/d5x87Fvg8H+31tcMfzOwgEjbxsiUjMZH+qLSGd4
	KIDDQgTnsJ5mzZkuu67C3uvavx+GsD38V1EQKLD8r6c0+luNtuxoSpCf3xU84pgJ
	96uokuGZ6RR/x+HFUFalgW1JRC2IcOUWFxFeSOGs3yW4ZmHGhbRiLA/ssZKY3XU7
	wX+GKIzvv1jGQYwIG/5apgZWw0TaZ4XHKxTRSjASSDfq54xCha0bASTqsm1ZCWoK
	7TFieEz6GMxUmWFjHyxFHRtaVo607ls2T8846h7WYH+/SE/bJjuRQU+gPbLH7hN2
	IANMdg==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 429mh555ph-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 16 Oct 2024 15:17:59 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 49GFHvtN006354
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 16 Oct 2024 15:17:57 GMT
Received: from [169.254.0.1] (10.49.16.6) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 16 Oct
 2024 08:17:57 -0700
From: Jeff Johnson <quic_jjohnson@quicinc.com>
To: <ath12k@lists.infradead.org>, Kalle Valo <kvalo@kernel.org>
CC: <linux-wireless@vger.kernel.org>
In-Reply-To: <20241011173323.924473-1-kvalo@kernel.org>
References: <20241011173323.924473-1-kvalo@kernel.org>
Subject: Re: [PATCH] wifi: ath12k: add missing lockdep_assert_wiphy() for
 ath12k_mac_op_ functions
Message-ID: <172909187769.412681.9881544527970265650.b4-ty@quicinc.com>
Date: Wed, 16 Oct 2024 08:17:57 -0700
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.0
X-Originating-IP: [10.49.16.6]
X-ClientProxiedBy: nalasex01a.na.qualcomm.com (10.47.209.196) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: aGFJCk5uUixlfpEo5GblVvYZPsu_ZxG8
X-Proofpoint-ORIG-GUID: aGFJCk5uUixlfpEo5GblVvYZPsu_ZxG8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 clxscore=1015
 spamscore=0 priorityscore=1501 adultscore=0 mlxlogscore=582
 lowpriorityscore=0 mlxscore=0 phishscore=0 malwarescore=0 suspectscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2410160096
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241016_081803_318848_46905BD3 
X-CRM114-Status: UNSURE (   7.82  )
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


On Fri, 11 Oct 2024 20:33:23 +0300, Kalle Valo wrote:
> Use lockdep_assert_wiphy() to document the ath12k_mac_op_ functions which are
> called under wiphy_lock(). And make sure that the functions which already have
> that is in the beginning of the function.
> 
> No functional changes.
> 
> 
> [...]

Applied, thanks!

[1/1] wifi: ath12k: add missing lockdep_assert_wiphy() for ath12k_mac_op_ functions
      commit: c347f18160219ac75b0c79be983e500b5959fb88

Best regards,
-- 
Jeff Johnson <quic_jjohnson@quicinc.com>


