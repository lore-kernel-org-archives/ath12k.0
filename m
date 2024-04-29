Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 670D6C4345F
	for <ath12k@archiver.kernel.org>; Mon, 29 Apr 2024 10:16:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jPlEP33CYg+upQYQFVTflX5bQM94xo05FV4pnt4rggg=; b=pGIHy9lZyXsPCd/ru2x8+CfX1t
	DSkmc4gufyYAMpy93ITXUlhq5QgaMM2W/HcJDp07oH1lgVCp+vI7h8Jls5q2hT+guASfmRKfgf3bs
	85kzAtbRDdcFVTNutW/xlvBCs30V+x/SJE71sQiJENZs2+Iy3sUeSmTokKQmDBYhdAM7FlUfYmB0Y
	yLFJqpOsoqypS0n2C3b2HgcjXZN+a6cP5iclw5zyTjW3Ayi7uPkR3IXTj/QMSbxe1sdRDYs/u3WXD
	fRUxfdfa5WsdxJSU3szDWR56tyJ+jeTj4XGZ4Mu69q38t9JN4SuZWgeEUECejmOfN5QytbNZjCFWe
	tA8BeVxA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s1O3z-00000002DuO-42T1
	for ath12k@archiver.kernel.org;
	Mon, 29 Apr 2024 10:16:47 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s1O3x-00000002Dsw-0Zyo
	for ath12k@lists.infradead.org;
	Mon, 29 Apr 2024 10:16:46 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 43T8ZqEp017158;
	Mon, 29 Apr 2024 10:16:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	message-id:date:mime-version:subject:to:cc:references:from
	:in-reply-to:content-type:content-transfer-encoding; s=
	qcppdkim1; bh=jPlEP33CYg+upQYQFVTflX5bQM94xo05FV4pnt4rggg=; b=kM
	ZRxtTiCT4Yykw1bQTb03z5zrceCBQOgPQNI+//RMXE6GrXm2dUjGx4S3yT0zgdl5
	D8DUAWkp9DyW8pzNSpWVZLneCM9Rhapugdh7xz55KJpFMmFhD5YstS7CD9tKCQyw
	+kshwTX+Yd5Fk3wxD/9Ie10aeowUP6N2K1OO/DKO+epyoK+fOsnP8E/RKZ2AhXaf
	GNNbZ7NE1srjNp4F+vBm6SFMPpM6GXo75v3Xfbz/RzQBs0Ub+xLGYhD0SoHpJS4n
	AZbdHH2xmuj/wIerBmEYYZQn7QYKkIdt3sDDwD7EwpiEEWqu4FnPseCnMlkPZwqp
	zhhH0R2hbS6K/gZneCgA==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3xt85s86cx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 29 Apr 2024 10:16:38 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 43TAGadm015491
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 29 Apr 2024 10:16:36 GMT
Received: from [10.152.206.169] (10.80.80.8) by nalasex01c.na.qualcomm.com
 (10.47.97.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 29 Apr
 2024 03:16:34 -0700
Message-ID: <7848b9bc-e3db-f131-9329-3a2970370fda@quicinc.com>
Date: Mon, 29 Apr 2024 15:46:31 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.0
Subject: Re: [PATCH] cfg80211: Allow pre-CAC for self-managed wiphy
To: Kalle Valo <kvalo@kernel.org>
CC: <ath12k@lists.infradead.org>, <linux-wireless@vger.kernel.org>
References: <20240429042723.2847389-1-quic_hprem@quicinc.com>
 <87mspcr57t.fsf@kernel.org>
Content-Language: en-US
From: Harshitha Prem <quic_hprem@quicinc.com>
In-Reply-To: <87mspcr57t.fsf@kernel.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: Qosp8iYXwrGtoDqR1AnZWXfrkZmawhnq
X-Proofpoint-ORIG-GUID: Qosp8iYXwrGtoDqR1AnZWXfrkZmawhnq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1011,Hydra:6.0.650,FMLib:17.11.176.26
 definitions=2024-04-29_07,2024-04-26_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=596 adultscore=0
 impostorscore=0 mlxscore=0 suspectscore=0 bulkscore=0 phishscore=0
 priorityscore=1501 malwarescore=0 spamscore=0 clxscore=1015
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2404010003 definitions=main-2404290063
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240429_031645_473269_19532C49 
X-CRM114-Status: GOOD (  10.99  )
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



On 4/29/2024 1:05 PM, Kalle Valo wrote:
> Harshitha Prem <quic_hprem@quicinc.com> writes:
> 
>> Currently, to allow pre-CAC it requires both driver's regulatory domain
>> in wiphy and cfg80211 local regulatory domain to be same, along with the
>> region to be in ETSI.
>>
>> But, for self-managed driver, some countries have mismatch between these
>> two regulatory domains and it would not allow for a pre-CAC. For example,
>> in ath12k driver (self-managed), country Sri Lanka (LK) is classified as
>> FCC domain as per cfg80211 local regulatory database but as per ath12k
>> driver it falls under ETSI domain then because of this mismatch, the
>> driver might not be able to do a pre-CAC.
>>
>> Hence, add changes to allow pre-CAC based on wiphy's regulatory setting
>> if it is a self-managed wiphy.
>>
>> Signed-off-by: Harshitha Prem <quic_hprem@quicinc.com>
> 
> "wifi:" missing from from title but I suspect no need to resend just
> because of this.
> 
sure, missed it. Thank you for pointing out, I will take note of it.

Regards,
Harshitha

