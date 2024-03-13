Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F36DFC54791
	for <ath12k@archiver.kernel.org>; Wed, 13 Mar 2024 15:06:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UA04qnuG9mPDr6gf73looLo9QneIYVq4T7oMMn5DEeU=; b=rMjGul7CfwQ7uOHlmszZrR+Yrr
	t8YixxLm1Ri+0c8n/M3Ubd9LnicfGBzUwgMv5B+A3wfMwQT4vAo204ZsxiR1wZglbDwqk2LfUiCaq
	2nhRbVXph3PTYL4EU2L6XyVSexvjd+PNDXcp5Kl1ssuyOJ5WK45upZI0fCzyhEaSVfsdxpFJpjugC
	MCbGoP7dWISv4jK2kN0ZTPe3rp6aCIIB1U6cYprp5IWrV3ZFZ3lJnYJQrpGTZOJ/XtYCJEmz24mYp
	1GxiqEJ00t9AUecAOhG83nSWY1uSMoJlCgvrNROd24v2C+dRxALgQHszL5DwfzdUqOtGPnOt54/uH
	NePDIuiA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rkQBH-0000000AXhc-2eVq
	for ath12k@archiver.kernel.org;
	Wed, 13 Mar 2024 15:06:11 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rkQBB-0000000AXgG-2GzB
	for ath12k@lists.infradead.org;
	Wed, 13 Mar 2024 15:06:08 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 42DCSTVO032409;
	Wed, 13 Mar 2024 15:06:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	message-id:date:mime-version:subject:to:cc:references:from
	:in-reply-to:content-type:content-transfer-encoding; s=
	qcppdkim1; bh=UA04qnuG9mPDr6gf73looLo9QneIYVq4T7oMMn5DEeU=; b=Bf
	4/ENenDhaSrhrs/1LOPX7XJgrfR6ZVCJlnpU7T9MPDEXvKEP+RyEa8P1gXKNhSOb
	rujOOiqI2nAHk7pDVRJxCgShGD+6lQd8qOHa1m88i2jvCCP6aTFeZC2SlUOx/IKe
	dWyPRiuxcMe1rkjo54Bnk9vr+rb0WU5wXnRNUVMGrwBCAZMdR1oVQGs55xI6BAog
	6nSBEdqigkDOWpg5uw39RhJ5fQnFTwYuX7p3Y5+2CksE8DLfsdT8Vqfs6TVxrSmF
	R2nHyGWOSn+r95mF/239O4seJAyUnVtXhRt15UDRvlgla8OMq1ejIvRpd6Uc9gL7
	AmYt284wqZJWZyo7Gzdg==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3wuapeghas-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 13 Mar 2024 15:06:04 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 42DF63Ys022535
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 13 Mar 2024 15:06:03 GMT
Received: from [10.110.27.195] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Wed, 13 Mar
 2024 08:06:03 -0700
Message-ID: <605a673e-3686-47d0-b71b-1e314fde65db@quicinc.com>
Date: Wed, 13 Mar 2024 08:06:02 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 01/12] wifi: ath12k: add multiple radio support in a
 single MAC HW un/register
Content-Language: en-US
To: Rameshkumar Sundaram <quic_ramess@quicinc.com>,
        <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>,
        Karthikeyan Periyasamy
	<quic_periyasa@quicinc.com>
References: <20240312135557.1778379-1-quic_ramess@quicinc.com>
 <20240312135557.1778379-2-quic_ramess@quicinc.com>
 <4a527729-2bf8-47ce-8275-d36b76bde95c@quicinc.com>
 <3178cf8c-d328-4fe2-b3be-f5c4c908f20f@quicinc.com>
From: Jeff Johnson <quic_jjohnson@quicinc.com>
In-Reply-To: <3178cf8c-d328-4fe2-b3be-f5c4c908f20f@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: DrfVzUE-fZ63G8kTimOrk-dYyobf-BHh
X-Proofpoint-GUID: DrfVzUE-fZ63G8kTimOrk-dYyobf-BHh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-03-13_09,2024-03-13_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0
 lowpriorityscore=0 phishscore=0 adultscore=0 suspectscore=0 clxscore=1015
 impostorscore=0 mlxlogscore=895 spamscore=0 malwarescore=0 mlxscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2402120000 definitions=main-2403130113
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240313_080605_736461_65F42D40 
X-CRM114-Status: GOOD (  10.77  )
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

On 3/13/2024 5:57 AM, Rameshkumar Sundaram wrote:
> On 3/13/2024 3:23 AM, Jeff Johnson wrote:
>> and guess we have to figure out how to suppress the ath12k-check issues with
>> this macro
> ath12k-check complains about the reuse of ah and index arguments which 
> may get evaluated multiple times if its an arithmetic expression, But 
> areas where we use the macro in our code aren't doing so.
> Do you have any suggestions here ? or shall we go back and use this 
> for-loop inline.

The macro makes sense -- we'll need to update the overrides in ath12k-check.

/jeff



