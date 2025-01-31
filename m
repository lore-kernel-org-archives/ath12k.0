Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93B86C0218A
	for <ath12k@archiver.kernel.org>; Fri, 31 Jan 2025 01:15:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gMGVgR75MTrOYJ271BzFJz5EknBbsyiIL+wi6HeOkO8=; b=tiGRTvCrdqXCNjYdLFonfnbUFM
	93+G9rUkxa1EXG6qpqoSOKol6+PMiVBFkwO74OiPx2dVxizU+QQBXWvIePGtfo96nMgF05c6kJd/G
	0CgomdCHTGFm0FYWMqyAr/6QpMAjfzEKbsKTOwuWs8jQ9XQQRB+t60ZIX03vs2KQWJCTXntpEx2kY
	EiZek8FQQFudDrUR0DqZoDWl5sn+H85xX1abW/iOXPUeVwF5wxXnaj+D52GCBMftmTQMECkes9As6
	RDgQUa5UZL+zap9Uhm+eaevLsLPy+sN56LGeNZW/FtcNIliszUkZkVq5ol7qu5yfEVlukvJimHAnk
	fkiwHYBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tdfdO-00000009tEd-0SMA
	for ath12k@archiver.kernel.org;
	Fri, 31 Jan 2025 01:15:50 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tdfdK-00000009tEH-41d1
	for ath12k@lists.infradead.org;
	Fri, 31 Jan 2025 01:15:48 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50UJ1rED021475
	for <ath12k@lists.infradead.org>; Fri, 31 Jan 2025 01:15:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	gMGVgR75MTrOYJ271BzFJz5EknBbsyiIL+wi6HeOkO8=; b=I5YOTDj/OFRXrbdh
	aNuRJgMiPlP+rfyLwA64b/hfgTSeCfe+sqR2et3NN0okTWf/YtAsMBy7HFBaIMul
	llUXMdF2peSgIcga/4D+xN+oTmtIIY7X2EMKYEbk2J93g1vnJ0EY5B+QRnhRyLvg
	YDjmhonHSVGCeE92hLSQJgq+cMZmaKz5zeIqo7MZj2uQFpixZGcrH47n94znCblC
	FaC7F7sKYxyVNw2PgsEvhGwuLJKiDG8ujiK8bhWHY8znKTqoquD67EuiWByUa2S+
	lOl5HXA+PXI2OGW74cT8VbX8DbpROHDjU6yO4Lb0oL0P0Rza+GpCQuoJanv9Lhjn
	bDuy6A==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44gf7m0ngp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Fri, 31 Jan 2025 01:15:44 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-21661949f23so40640855ad.3
        for <ath12k@lists.infradead.org>; Thu, 30 Jan 2025 17:15:44 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738286143; x=1738890943;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=gMGVgR75MTrOYJ271BzFJz5EknBbsyiIL+wi6HeOkO8=;
        b=WeDm2WTcLjSA9P2NBrbo0qD7yHqy+LDvRCgdqC4J3jbUqjRxFgd4ax01euhBuCrQnX
         6MUXWKL8DGm5yQBAnJtWUiO47Q2natJx5HQ5m/gWyCjrT9SxhY4oU0/FIqp5tIwgme8J
         HIWTyZf+CXu73QskI2e59VfWFn/bIF1RhaRLrLebuWHuYBy+zEK+f0ZpQBkoHcDm3sl0
         4cU5H0dl8ojh7/F82QN7Fs8ZhjhvBrvUHlqqwFAhWWLHg0ktAAB4NDuA2+71wlm49adE
         A8+gFP5FrsUJdeHm/cIbWoGRNmnUccSBHHt65uO0w1qqW9DoUYK+UN3bxdE5m/pSyfM4
         mDiw==
X-Forwarded-Encrypted: i=1; AJvYcCUND5ZCv0DH1Xr+QJcqWzJNfCtjHOFeX2ojmw9qM80p1f8jkdFYWRv6kEzVAPeksoo2WpxUsws=@lists.infradead.org
X-Gm-Message-State: AOJu0YxibuM9pBGTD/iHMqmOqGfLN+8EshpAaPRVwC16QlMQnO/X12Dn
	qvki/DhwKUx6ZZyqEKWZOOto/li3UeXJRgzsErACuMND33YKM6SoThWIbBGj1VQVYmLi0Cb1VEt
	lT5N3Ex34bwKWRcdQY/qBAfRqhci8STDY5VkaG8Tztva5Yx22y0JYYtVXL21+
X-Gm-Gg: ASbGncurX/LILS439l/S/Uc2slfWuyIp5jaqsGez5GYi826mlTIaabFK/gpUHPs8D2B
	f0brLNk9Hs02gzS+wrz8RF7UN2EpoqML7WZOFgQ7aZs+479Klx9Cp/P80I0mkCUv2IoueO/HAc9
	lxzJjr411cDADdm8lFyab6DNYmKCLunPGYexqq4ej+APJWUEovqdTMoMpWbe/rm3+oy9ncEE+bu
	ILd4S3CB05cU9Vv6ZEOQffah0QhZmAUGBFI2Z2MHYKhGWTFE4RHmjGEbLFCTla6Y+GBlFjwKUEc
	OVEe38D4zcgQyh2I46zEJWi8PT8fzbTej7k3ptXCquQ62Cp1OeuBC0m8Ad8UwiUgjIm/TnflpA=
	=
X-Received: by 2002:a05:6a20:12c1:b0:1db:e0d7:675c with SMTP id adf61e73a8af0-1ed7a4c9922mr16931229637.13.1738286142993;
        Thu, 30 Jan 2025 17:15:42 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEFUUaTKw8RFo6zih1oBkByL8kEw6QPB1jmjVF69kXUC5I3oIP5HsKduU9vCArUVV+bcLpxDA==
X-Received: by 2002:a05:6a20:12c1:b0:1db:e0d7:675c with SMTP id adf61e73a8af0-1ed7a4c9922mr16930621637.13.1738286134966;
        Thu, 30 Jan 2025 17:15:34 -0800 (PST)
Received: from [192.168.1.111] (c-73-202-227-126.hsd1.ca.comcast.net. [73.202.227.126])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72fe6424f81sm2105593b3a.37.2025.01.30.17.15.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Jan 2025 17:15:34 -0800 (PST)
Message-ID: <2af37a7c-567f-4687-b290-92beeac339f3@oss.qualcomm.com>
Date: Thu, 30 Jan 2025 17:15:33 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 0/3] wifi: ath12k: Support dump PDEV transmit and
 receive rate HTT stats
To: Aditya Kumar Singh <quic_adisi@quicinc.com>,
        Lingbo Kong <quic_lingbok@quicinc.com>, ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org
References: <20250113071758.19589-1-quic_lingbok@quicinc.com>
 <552fd4f9-7787-456a-b6d7-de7b96fa60e4@quicinc.com>
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <552fd4f9-7787-456a-b6d7-de7b96fa60e4@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: ENnGgEKFwRrvU6sSmVXc8INaqkqGhBmf
X-Proofpoint-GUID: ENnGgEKFwRrvU6sSmVXc8INaqkqGhBmf
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-30_10,2025-01-30_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 malwarescore=0 mlxlogscore=870 clxscore=1015 spamscore=0 phishscore=0
 mlxscore=0 suspectscore=0 adultscore=0 impostorscore=0 bulkscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2501170000 definitions=main-2501310001
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250130_171547_140191_B3D371B9 
X-CRM114-Status: GOOD (  12.21  )
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

On 1/13/2025 12:33 AM, Aditya Kumar Singh wrote:
> On 1/13/25 12:47, Lingbo Kong wrote:
>> Support to dump PDEV transmit rate stats through HTT debugfs stats type 9.
>> Support to dump PDEV receive rate stats through HTT debugfs stats type 10.
>> Support to dump additional PDEV receive rate stats through HTT debugfs stats type 30.
>>
>> v4:
>> 1.used tab(s) to align the = to match the existing code
>>
>> v3:
>> 1.Rebase again to 48322e474f04
>>
>> v2:
>> 1.use TAB to be consistent with existing code
>>
>> Lingbo Kong (3):
>>    wifi: ath12k: Dump PDEV transmit rate HTT stats
>>    wifi: ath12k: Dump PDEV receive rate HTT stats
>>    wifi: ath12k: Dump additional PDEV receive rate HTT stats
>>
>>   .../wireless/ath/ath12k/debugfs_htt_stats.c   | 500 ++++++++++++++++++
>>   .../wireless/ath/ath12k/debugfs_htt_stats.h   | 182 +++++++
>>   2 files changed, 682 insertions(+)
>>
> 
> * drivers/net/wireless/ath/ath12k/debugfs_htt_stats.c: 2025 copyright 
> missing
> * drivers/net/wireless/ath/ath12k/debugfs_htt_stats.h: 2025 copyright 
> missing
> 
> No need to respin just because of this.
> 

Yes, I can make those changes.
Would be nice to get Reviewed-by tags if the series LGTY.

/jeff

