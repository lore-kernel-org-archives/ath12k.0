Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 317C1C04FF9
	for <ath12k@archiver.kernel.org>; Mon, 15 Apr 2024 16:59:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3P/WF7aPI6S3uL6q4V3kjgIjsT6cD2PHvJ8GsHpmoBY=; b=EJCwV2pBPHJYDPtyok2LchLF8h
	RqBKiOyrwiMPs78jXexUDgou7PpjN0VTRg/0JtrZ/n5mL4sGqq7+f3WjC69lEKZREDGSvTTwEH7Xp
	CILxZQ8sI2O9+VwwkNUpHSIYSer/xvR6/xs07zZOj2mL+wI9OfuhJHBx0YZwAex6FttcqNRb5WSa0
	kau72Ies4fKalwdbOI0n8kyDlLNkBhbNlV+CTYx485o5UHdAsJXp/R84hQpLAE8rKUNXjisHZGT8I
	vStyjE6c76zmmWIwsJNBLDMb/iQPq+J8My94MqFkaT9yIlqDZhGZaPAn2P/JnwINntKmsDDtqfMZg
	ZuBBKRbg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rwPg3-00000009B16-37y6
	for ath12k@archiver.kernel.org;
	Mon, 15 Apr 2024 16:59:31 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rwPg0-00000009AzC-16Y1
	for ath12k@lists.infradead.org;
	Mon, 15 Apr 2024 16:59:29 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 43FDx8ZR030999;
	Mon, 15 Apr 2024 16:59:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	message-id:date:mime-version:subject:to:cc:references:from
	:in-reply-to:content-type:content-transfer-encoding; s=
	qcppdkim1; bh=3P/WF7aPI6S3uL6q4V3kjgIjsT6cD2PHvJ8GsHpmoBY=; b=JE
	hclrWFZ6wnH5HB3XTs/A0ANL1L/fD+h9i8aqwaHe5TmdeiC64IE3W7W6kiEenj/K
	S9kty8322bLI1ruEF6Xpy7S5eEwcjF6frhAExvJdVAfUBL6u+9a/ZCJwVLKl8NOn
	yAvdYQGMCyDmMi8VngAzgCsjJmOUAknwMYLTLqzUcKCg6X384QiUYXUu828+5O/5
	Lgo/Fw/seGHYPhq17o7Q2Yjq7DT9R16BVl/j9E3PM5VqxlYBDXudKcqFwI4jbHNi
	dVXNOlsOd1PNlrtyiRBUYwaeNn4xhfigQ385PGB9J755W1fnTT+Z2FGqO1YAgYrN
	BsZZ1kYJGMNbZb4JaSgA==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3xh5jx8f65-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 15 Apr 2024 16:59:24 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 43FGxM1K012205
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 15 Apr 2024 16:59:22 GMT
Received: from [10.110.3.16] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 15 Apr
 2024 09:59:22 -0700
Message-ID: <c5080887-6d94-405d-a57b-dae5e6a57721@quicinc.com>
Date: Mon, 15 Apr 2024 09:59:21 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] wifi: ath12k: enable WIPHY_FLAG_DISABLE_WEXT
Content-Language: en-US
To: Kalle Valo <kvalo@kernel.org>
CC: <ath12k@lists.infradead.org>, <linux-wireless@vger.kernel.org>
References: <20240411165645.4071238-1-kvalo@kernel.org>
 <e8618364-e547-41e1-b18f-4cddeafd3371@quicinc.com>
 <87h6g2y4jp.fsf@kernel.org>
From: Jeff Johnson <quic_jjohnson@quicinc.com>
In-Reply-To: <87h6g2y4jp.fsf@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: fVPRfGot8hFZXB0i8XiWls_e4E6A9yGd
X-Proofpoint-ORIG-GUID: fVPRfGot8hFZXB0i8XiWls_e4E6A9yGd
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-04-15_14,2024-04-15_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 phishscore=0
 suspectscore=0 adultscore=0 impostorscore=0 bulkscore=0 lowpriorityscore=0
 mlxlogscore=476 spamscore=0 mlxscore=0 malwarescore=0 priorityscore=1501
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2404010003
 definitions=main-2404150111
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240415_095928_470434_F038CED8 
X-CRM114-Status: UNSURE (   7.25  )
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

On 4/15/2024 9:27 AM, Kalle Valo wrote:
> Jeff Johnson <quic_jjohnson@quicinc.com> writes:
>> Is there a Ubuntu / Network Manager fix fir this?
> 
> I would hope that Network Manager doesn't use WEXT or especially run the
> iwconfig tool. This is why I suspect that you run iwconfig manually.
> 

I am not running iwconfig manually. I'm simply using the Ubuntu wifi settings
menu to enable Hotspot. So somewhere under the hood Ubuntu/NM is running iwconfig



