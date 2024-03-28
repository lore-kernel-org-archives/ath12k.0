Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7A1DCD1283
	for <ath12k@archiver.kernel.org>; Thu, 28 Mar 2024 16:40:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yr4JEmcLAZfVav3gXQyZ/EMgnf1R26J5E0Wv2UEyo9A=; b=eR0FlEO1+eDvNnXbTzB9M71hRx
	QwQGcZJsejZmbbnbBMGR9NEInWrS64fRVb9F9/6LjZHxnFdTWQ+Uu1X/NoQ4HYMr4+HIHmfK5q/uV
	H6mmsgRp6K9PsCBAOXyuesBJMtPuATpYnLDeGjC346f40o9ph0PciV5OM5xO4om+kYFp78F/VWPex
	q+ARWG8+wMBmelIRqd9yeWLI/8UkZBU8sbnf6Oh3EUmj1lONAnnpj0oweqs3Kav4jZfpivy9CSREB
	CYCXFKsKf8w2/a5oxtnOfGU64siHS5rh/BImx+MFhq6MEyLZ4b06hAch6rxxvueUrfN2AxTlQbpBC
	DSm/iZfA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rpsni-0000000EmNE-07Si
	for ath12k@archiver.kernel.org;
	Thu, 28 Mar 2024 16:40:26 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rpsnA-0000000EmE6-2FQb
	for ath12k@lists.infradead.org;
	Thu, 28 Mar 2024 16:40:02 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 42SGV60T001709;
	Thu, 28 Mar 2024 16:39:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	message-id:date:mime-version:subject:to:cc:references:from
	:in-reply-to:content-type:content-transfer-encoding; s=
	qcppdkim1; bh=yr4JEmcLAZfVav3gXQyZ/EMgnf1R26J5E0Wv2UEyo9A=; b=AW
	5yfS33gCX97+GSCJ2w3WIkRLc4/vlr2ezFDub0/RwaIyN/VbucrnXGVDreOqT78m
	6RPcB83hOhy02edzorkK30e9vq1jwCoi4f3Yc+cN1r1sbVN9mVnxZGSIZJD8gRxC
	ratIbaoQrsi52wERAPTARxYcKKiaJ/11LQj88v8OFvZw8Aj1I6BqarBXQ8c9eews
	21jRIjNo1Z0pSmuqBDtgyBtLY3Cq7scpEWwVuwcMWZHf/65DYn/8drZMLplQYpoA
	ico36+ybz9EwWg7HvNe7+vHS9afWsAVTr4DZmFW+krJa3OMmYQK3LJRgIuXuYw/N
	6E9b8mLJiJPbf9dnvlkA==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3x4u1wm23r-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 28 Mar 2024 16:39:44 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 42SGdhKJ011287
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 28 Mar 2024 16:39:43 GMT
Received: from [10.110.124.221] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Thu, 28 Mar
 2024 09:39:42 -0700
Message-ID: <2498ac14-564d-40d9-b911-feff57d6770c@quicinc.com>
Date: Thu, 28 Mar 2024 09:39:41 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 11/13] wifi: mac80211: Add multi-hardware support in the
 iface comb helper
Content-Language: en-US
To: Johannes Berg <johannes@sipsolutions.net>,
        Karthikeyan Periyasamy
	<quic_periyasa@quicinc.com>,
        <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>,
        Vasanthakumar Thiagarajan
	<quic_vthiagar@quicinc.com>
References: <20240328072916.1164195-1-quic_periyasa@quicinc.com>
 <20240328072916.1164195-12-quic_periyasa@quicinc.com>
 <ca70eeb3cdee1e8c3caee69db595bc8160eb4115.camel@sipsolutions.net>
From: Jeff Johnson <quic_jjohnson@quicinc.com>
In-Reply-To: <ca70eeb3cdee1e8c3caee69db595bc8160eb4115.camel@sipsolutions.net>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: zqLI35EgeO_VYq_xE50mnwvghielyJKs
X-Proofpoint-ORIG-GUID: zqLI35EgeO_VYq_xE50mnwvghielyJKs
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-03-28_15,2024-03-28_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 malwarescore=0
 adultscore=0 lowpriorityscore=0 bulkscore=0 phishscore=0 impostorscore=0
 mlxlogscore=641 mlxscore=0 spamscore=0 suspectscore=0 priorityscore=1501
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2403210001
 definitions=main-2403280114
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240328_093954_211427_EFCFB9A3 
X-CRM114-Status: UNSURE (   8.74  )
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

On 3/28/2024 7:41 AM, Johannes Berg wrote:
> I was almost going to write "links" instead of "interfaces" there, which
> reminds me that none of this really even works well for MLO yet. Not
> sure if that's better addressed as a separate first step?

we are following the sequence:
1) go from per-hw wiphy to wiphy that supports multi-hw (multiple patchsets
under review)
2) add hw-to-wiphy grouping infrastructure (hopefully coming soon)
3) add MLO on top of the grouping infrastructure

So we consider this to be part of the 1st phase

