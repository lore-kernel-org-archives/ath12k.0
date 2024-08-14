Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8DE9CC3DA4A
	for <ath12k@archiver.kernel.org>; Wed, 14 Aug 2024 12:00:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5zdFSxb5VpWbTZohe++rSMkyFV0J22dBX+/LXFRg9lU=; b=2zZo+tyuwKt8YNUrUT+ipAjb1G
	jGaXz/zEUOFV7ezLSWNX4ipRAg35/sF5Rfub/c+jAZCgq/laZsKxpBI3h5KHVw642hU7ej5Sup+HV
	QUR9JaG1ikp43Zfg3OdavAQWvNHdL6w+f6SfYjLHj6S734Er56kAEKpWvf0VrPw0GOyKPhMVfYeY5
	dw3IC3G1eIHvjT6cBUETbSAH1zeuPNeigjrk5AwTRaoxUM0bRQURhMLJwychrCWziueWsZQqDY7Th
	DnIqLLL+wa9g4DOa1b9o7BiblFTn4h9bsyol52v47xEd+XqPB3323BZrC6Z1GigbUCWTxlhfl+SNw
	sclHr6uw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1seCgH-00000006rE5-0xnF
	for ath12k@archiver.kernel.org;
	Wed, 14 Aug 2024 12:00:45 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1seBSZ-00000006eng-1Mdg
	for ath12k@lists.infradead.org;
	Wed, 14 Aug 2024 10:42:52 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 47EAT1o4026148
	for <ath12k@lists.infradead.org>; Wed, 14 Aug 2024 10:42:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	5zdFSxb5VpWbTZohe++rSMkyFV0J22dBX+/LXFRg9lU=; b=ZxWAaXJ5E5d24Fbz
	IvLf38vzCIe9dszslJlyWCET610YX5UhhNHufPgP7WJ0jq8Wob+1jy8by1NS9DcY
	eFvNf0ex+REmKz2xUD6JFH+zJIYaxjl7Fjp07S9KRjWpqxO3y4fz8X4BSyDg/vZo
	mARxOLwvXDrJ9CbtrtBRoTSDxNO3RGaLocBbIxYVbLfJRU7bwTAYDIEtoVMSvZLo
	0E6NdFW7gP/JNVdQEeW2FuaedNPgt91NefJhaPss1Xl9JXxWVeRyh/CMY+vORZdT
	OvEpeNrqiB48MkczT7vb0TPwCOKlzQzjIBPsSxrslsfMBSyK28I5DzNxG8KvIkN1
	+eUHgA==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 40x18y2y72-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <ath12k@lists.infradead.org>; Wed, 14 Aug 2024 10:42:30 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 47EAgTMf015349
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <ath12k@lists.infradead.org>; Wed, 14 Aug 2024 10:42:29 GMT
Received: from [10.231.195.67] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 14 Aug
 2024 03:42:28 -0700
Message-ID: <be53813c-3edc-4734-b59d-83f43f14ea91@quicinc.com>
Date: Wed, 14 Aug 2024 18:42:26 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: wcn7850 issues
To: <ath12k@lists.infradead.org>
References: <LO0P123MB4057D6C2F6FEFF335B30EE7CD6BF2@LO0P123MB4057.GBRP123.PROD.OUTLOOK.COM>
 <LO0P123MB4057122D4C7D07C7114F5ABED6BF2@LO0P123MB4057.GBRP123.PROD.OUTLOOK.COM>
Content-Language: en-US
From: Baochen Qiang <quic_bqiang@quicinc.com>
In-Reply-To: <LO0P123MB4057122D4C7D07C7114F5ABED6BF2@LO0P123MB4057.GBRP123.PROD.OUTLOOK.COM>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: krm-Cwy6aVnl9R2Mju94E0CuyS7GBd4U
X-Proofpoint-ORIG-GUID: krm-Cwy6aVnl9R2Mju94E0CuyS7GBd4U
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-14_08,2024-08-13_02,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 mlxlogscore=617
 suspectscore=0 phishscore=0 malwarescore=0 mlxscore=0 spamscore=0
 lowpriorityscore=0 impostorscore=0 clxscore=1015 priorityscore=1501
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2407110000 definitions=main-2408140074
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240814_034231_554007_9936511D 
X-CRM114-Status: UNSURE (   8.12  )
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



On 8/6/2024 4:06 PM, david Atkins wrote:
> No support for EHT and therefore no MSC 12 or 13 which fits with the 
> dmesg warning about it not being supported, 
did not noted this ... So if AP does not support EHT, above warnings makes sense, like you said.

is this a card firmware 
> issue rather than the driver?
did not follow you here, why is it an issue?


