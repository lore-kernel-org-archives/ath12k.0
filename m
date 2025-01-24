Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 127C3C02181
	for <ath12k@archiver.kernel.org>; Fri, 24 Jan 2025 10:36:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6uGGIdlXXldRtFwWbGzDvOc99qkYb2v0wFM5jLExT9I=; b=ytSS82rN62Ft1a7M0yYai/xJFh
	I+DMV3mm08MzR4DHhKxGKfszsc1YRVx5KElHcHKdwyL/y6xAt/hYLsqaxLyujI5lCp/7aY6DZ08Xf
	DNFZs4JW9d15Tq/3ZlUEaj4aF/rBiYHouH9q1wGjGjSDDoUbpeLt4tKtNsaURB/KhD0QcPRpHsM33
	MuNfFgSyuOpwYFkJlYr//3/xJ16Lg8URCLBuoFjRGmRMVkrljCjiHxt4afi3D/3Xk+0G9xiGCXAal
	v9M+v8ShRWldrkbKF/aZd+QmBeUoNKEm28rPb3WvdbLa3SYSjSA1ENLmLDWzxxzYr9H2fsvgzjoHq
	XsFwRp+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tbH37-0000000ETEg-3VCy
	for ath12k@archiver.kernel.org;
	Fri, 24 Jan 2025 10:36:29 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tbH34-0000000ETEH-3xKE
	for ath12k@lists.infradead.org;
	Fri, 24 Jan 2025 10:36:28 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50O5NdCk029194
	for <ath12k@lists.infradead.org>; Fri, 24 Jan 2025 10:36:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	6uGGIdlXXldRtFwWbGzDvOc99qkYb2v0wFM5jLExT9I=; b=aOfrJOqmIdO1XdRH
	kDXtDzAgjiFiNCoC1NsisokOtcbacpOMPEhth8f1/5uM42cu15X055L0lukfoSSz
	X5uLUhsLDwC1j8u0miAyWarmClcI+IOTk9JZgo5B31z638O32LpaEEWTVn9po142
	FOEuQVZmHbqePwYjQN0s0L6rJERgTMY1uP7+LGAVdQYHjlRvykKiC42BzXRHC5xs
	VwZCHQGksOWVfDcL+0GUR/MqI6gtRzpMgcLQcBjzjfcjMbI3SXVgQoCtb2RnXRww
	fxsAKhdRGdTCO2Ip3evYQ6AB71xg+BJHmPn+6PR3+Vmwr7EJSO0zy7rEmGobkpmm
	9VLRTQ==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44c4p5gufr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Fri, 24 Jan 2025 10:36:23 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-2ee8ced572eso4169126a91.0
        for <ath12k@lists.infradead.org>; Fri, 24 Jan 2025 02:36:23 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737714972; x=1738319772;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6uGGIdlXXldRtFwWbGzDvOc99qkYb2v0wFM5jLExT9I=;
        b=lXZk1+GWE7WbP0lKKYSM9g1RIcKDKo+zpaxuoiRBhAP0Bij2CT7p8pHEa1vUSYLWLD
         PZRMBtpLeByjGQjFbgKhBXFD/AnsTuhpEKjuaz8+Tlq0Oe5MKcWHw2LXRmeHSh2+3ibR
         zUadNwykfx5Me6L7vManl5iIXFKyGpde03z445dkPUtTjOLZJkC9Q8y2eORgVh2xvWnC
         RlNdoIob+Gw2BOYe+xogHjxDsnEbuekUSpFHiqn/WwfTOLaXaKOr5DTZo60l0D2CCqet
         shlIs99QxyqQpnSE9LeHDOCm2Ywl9qV+NoZhQzsVxIja1JqKnokTNkwJGq48ehE+w2kQ
         m0Ag==
X-Forwarded-Encrypted: i=1; AJvYcCXqpsfZJdvJQhHD2TX3o7g9ddCuyNq0EfwPXi/VarIYKPzpywQroV3nRUPZ8R1U2UUqgT8jrvI=@lists.infradead.org
X-Gm-Message-State: AOJu0YytwAIpOmOdNhpoyFfbD+75qo7OkBizsR3DODqVNGctUXaPm1kp
	9BshJ4F0KD9zsyGSY7M9ZXbHq7lp5JepwgXMst8XESnZU4jFV1QDG4ceeykZyHl4OcVJaNdqcB/
	I6jbnNmr+DRjejcabDhjl74OTydi/hC+JILP01pXQWx8dULT4I17GrkIofJRS
X-Gm-Gg: ASbGnctD2J7kenn3Xpau6RrEQzEDecS/z7agH2CGgqY297MHk0EapWdJToIB1nnczUa
	+A086HGgmZSJo35VMgwq2HX3EWenRJCS6L1wUmfXPARPSDULrsnPTlvXQyvbyBywBu+DPYoQ9U8
	fUTougccdT/kNWCeu+0ySYwqlp1hCPFcCspnRxPAW6Vez0CSXzXG4xDp6GAUUah1fOLS2FRzHzo
	3PEyU/taBAxWPIFtiS0+LaeuxapsPu7mdXfknyS86bf/DhLFjGrP+BAWBz2TpnG6QXGYai2qzRk
	DjIZ/HmzJFWCEE/Zmi31oD2Mt2db
X-Received: by 2002:a05:6a00:4085:b0:72d:8d98:c256 with SMTP id d2e1a72fcca58-72daf945d6dmr40816771b3a.6.1737714971718;
        Fri, 24 Jan 2025 02:36:11 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFsJ2btK7ALifFinqP3IJ+s5UmpKuFPTgyA1L0BdCWIQ+RzjQUpPrO/7uP19boOYwhg7kbo3g==
X-Received: by 2002:a05:6a00:4085:b0:72d:8d98:c256 with SMTP id d2e1a72fcca58-72daf945d6dmr40816755b3a.6.1737714971352;
        Fri, 24 Jan 2025 02:36:11 -0800 (PST)
Received: from [10.152.202.18] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72f8a77c816sm1550749b3a.149.2025.01.24.02.36.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 24 Jan 2025 02:36:11 -0800 (PST)
Message-ID: <9dd584c1-3fb5-4528-9171-45f94690c187@oss.qualcomm.com>
Date: Fri, 24 Jan 2025 16:06:07 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] wifi: ath12k: Abort scan before removing link interface
 to prevent duplicate deletion
To: Lingbo Kong <quic_lingbok@quicinc.com>, ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org
References: <20250124093352.481-1-quic_lingbok@quicinc.com>
From: Aditya Kumar Singh <aditya.kumar.singh@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20250124093352.481-1-quic_lingbok@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: KCYGnpUmhEeE4ZFFaO6HXsnYpAkQARFF
X-Proofpoint-ORIG-GUID: KCYGnpUmhEeE4ZFFaO6HXsnYpAkQARFF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-24_04,2025-01-23_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 phishscore=0
 spamscore=0 mlxlogscore=999 impostorscore=0 bulkscore=0 malwarescore=0
 mlxscore=0 priorityscore=1501 adultscore=0 lowpriorityscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2501240077
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250124_023627_110546_0AA70E76 
X-CRM114-Status: GOOD (  13.34  )
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

On 1/24/25 15:03, Lingbo Kong wrote:
> Currently, when ath12k performs the remove link interface operation, if
> there is an ongoing scan operation on the arvif, ath12k may execute the
> remove link interface operation multiple times on the same arvif. This
> occurs because, during the remove link operation, if a scan operation is
> present on the arvif, ath12k may receive a WMI_SCAN_EVENT_COMPLETED event
> from the firmware. Upon receiving this event, ath12k will continue to
> execute the ath12k_scan_vdev_clean_work() function, performing the remove
> link interface operation on the same arvif again.
> 
> To address this issue, before executing the remove link interface
> operation, ath12k needs to check if there is an ongoing scan operation on
> the current arvif. If such an operation exists, it should be aborted.
> 
> Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0.c5-00481-QCAHMTSWPL_V1.0_V2.0_SILICONZ-3
> 
> Signed-off-by: Lingbo Kong<quic_lingbok@quicinc.com>
> ---

Reviewed-by: Aditya Kumar Singh <aditya.kumar.singh@oss.qualcomm.com>

-- 
Aditya

