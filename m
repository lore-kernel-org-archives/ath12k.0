Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8423EC30653
	for <ath12k@archiver.kernel.org>; Wed,  3 Jul 2024 15:00:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=m/bKG4t2st0hQyhBSyLObDlVRLLQvLL97ZBlWMauGC4=; b=oHpl7VIFq5ycnmXoQvk+lBUVh4
	2cvZcbEiCvjut0hoAWWYunywaifXBWMF+ojJbWd91MC3+pUJ3KbJwyUlwChDRb+F6kGp4u24dDxad
	9EAbvqasfKWAZ9PIUPkYL2DbZyIJ1XLYKIg06B5nuAVrExlqdB9LMUBZSyam54xv7RyBp4x8mx7fY
	zPbfX1Z/iJK8ABDpw8fUIFyXHYYLDgTgzSpMkkgPc8qSq07gQSee/kIUf8BC2+/e+zUb2l4+JQIFg
	5KqScWS7kPRR5NR2IMaZtrCB16VwKC8PvYZw2yo3Zx++aoUGX5rXoCGGbdW8nzj/gt5Vj3u5cja6J
	eL13uG0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sP1Td-0000000Aaj0-0SD7
	for ath12k@archiver.kernel.org;
	Wed, 03 Jul 2024 15:00:57 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sP0PN-0000000AMiF-2oMM
	for ath12k@lists.infradead.org;
	Wed, 03 Jul 2024 13:52:31 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4638BFfZ004367;
	Wed, 3 Jul 2024 13:52:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	m/bKG4t2st0hQyhBSyLObDlVRLLQvLL97ZBlWMauGC4=; b=N02kg3m7owPVW3Fh
	8FyG4BUmLKNY1gN6Nm12RsdRrPpIiRrqShtoljNNYnp+pgRLU2Bl3ZKaEKdk5HWS
	lfzCWvP34z3fgBznYcCb0TScUzdbvtq6Df8bOMx6ouc69MXeO1HAbEFSBbkIl+lQ
	rQoWq0H612gbXsswpzsCNb9y98ZvF4UuT2TXpW9I3wpOKnH124wz6OhfdY1YY5tu
	QfXqKX/Ad6O613nHl6EZtK1Gk1qrikAKbkHTB6HlFawgN6osqMhwOzwMw4xjgBfB
	FGHmP+aZy041NZiP4RryQ+WXIFbWIWocCZ7w8+yp59CAXXoFMD97k/BV/eiSPwBT
	E2tEFw==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4029uxgxv4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 03 Jul 2024 13:52:27 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 463DqQsA014456
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 3 Jul 2024 13:52:26 GMT
Received: from [10.48.245.148] (10.49.16.6) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 3 Jul 2024
 06:52:25 -0700
Message-ID: <d716ace7-c9cf-463e-a99c-0cfcc8b7c4ad@quicinc.com>
Date: Wed, 3 Jul 2024 06:52:24 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: WCN7850 - station mode MLO/MLD support
Content-Language: en-US
To: Janusz Dziedzic <janusz.dziedzic@gmail.com>, <ath12k@lists.infradead.org>
References: <CAFED-jk4n61WGtBOcT2OAbtmY-QdaKT+osadhSqLGDRMV7Q-NQ@mail.gmail.com>
From: Jeff Johnson <quic_jjohnson@quicinc.com>
In-Reply-To: <CAFED-jk4n61WGtBOcT2OAbtmY-QdaKT+osadhSqLGDRMV7Q-NQ@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.49.16.6]
X-ClientProxiedBy: nalasex01b.na.qualcomm.com (10.47.209.197) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: FOfp2qWrUgGHqW9FDqWwbeOdyRx9aqL-
X-Proofpoint-ORIG-GUID: FOfp2qWrUgGHqW9FDqWwbeOdyRx9aqL-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-03_09,2024-07-03_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=977
 priorityscore=1501 impostorscore=0 bulkscore=0 spamscore=0 mlxscore=0
 clxscore=1011 phishscore=0 malwarescore=0 adultscore=0 lowpriorityscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2406140001 definitions=main-2407030101
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240703_065229_941471_5FA6EEDB 
X-CRM114-Status: GOOD (  11.55  )
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

On 7/3/2024 2:19 AM, Janusz Dziedzic wrote:
> Hello,
> 
> I have this card:
> 0001:01:00.0 Network controller: Qualcomm Technologies, Inc WCN785x
> Wi-Fi 7(802.11be) 320MHz 2x2 [FastConnect 7800] (rev 01)
> 
> and kernel
> 6.10.0-rc4-next
> 
> and FW
> WLAN.HMT.1.0.c5-00481-QCAHMTSWPL_V1.0_V2.0_SILICONZ-3
> 
> Using it as a test client.
> I don't see WIPHY_FLAG_SUPPORTS_MLO is set in the driver.
> Could I simply enable it and MLO should work correctly more or less?
> Or I need special firmware with MLO support?

ath12k does not currently support MLO -- Some prerequisite changes are still
under review.

/jeff


