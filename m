Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33EE9C02181
	for <ath12k@archiver.kernel.org>; Wed, 22 Jan 2025 10:17:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=V/oUjLNTzQt+kt+cq0pXCT0A6dSRAMY5Cz1QkSnusyo=; b=kqj6d7kfQOhcN4pUffrefdkfT/
	wgoSNzdOViAjq5Pd5bgNlgLpnMYu4TF4AORzB+lBwaHJi5Wv9U7Vvn1AzHV5Nl8nrKCgncOfNfVxm
	TSg2dvpR51HbRhE7RCz8iL/U6aoA1/bfgpydV5/Mh5+Gj7PJtAiAH0cs4gVHFfQq4yScUZvLyD6Z3
	QKOmLSQyPyWircKzzZHqEw3zYMKdktx3R/Aq8RdQ4B0chDg4Qowg7K9d3BisCptaMPvHSklVdNjzv
	z53SHHlCWnqZdRSKWqhMeJ78/AIGyLXe1AB+jhfDB3x0kcEDCpLhRWJUbmMIJqNHHJ8V/MRZYdkkW
	zDRssv+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1taXnK-00000009uwO-42lt
	for ath12k@archiver.kernel.org;
	Wed, 22 Jan 2025 10:17:10 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1taXnH-00000009uvr-2QUr
	for ath12k@lists.infradead.org;
	Wed, 22 Jan 2025 10:17:08 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50M9oZU1002851
	for <ath12k@lists.infradead.org>; Wed, 22 Jan 2025 10:17:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	V/oUjLNTzQt+kt+cq0pXCT0A6dSRAMY5Cz1QkSnusyo=; b=FDSOnMG4yhuqvkMY
	uK6DOjcMyueGnOtNwwHXR5wSyCt4GzJx5ufTOhp0u2lhI+ysDcFaP1oXB9Qq+d4z
	b/oB1N+75UYxw8bcUz169k3KLo+7DAIXq4K4GllfhYDD6iUmQk4k+A3Yq4XBKOga
	+0nEW6ReSyv0Wf7CmyFEJ9CbvzzzXjARARS5hAkzBJyyMDlcONGVrkXXq2eatyUu
	uoSVUl2OCTl/ziXmvu7Lfzgo9beDJgNKgABdqOgTlOkC8q+4cZxAw/W6tj4sBaCo
	9kPfs24ref+IbrkWVq3FCeVArV8+6/xiEvvQWnUOTGOH9vzp8kCmmzRRoOIT/xA/
	3Gdb2A==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44axd8g2gb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Wed, 22 Jan 2025 10:17:07 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-216387ddda8so142993505ad.3
        for <ath12k@lists.infradead.org>; Wed, 22 Jan 2025 02:17:07 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737541026; x=1738145826;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=V/oUjLNTzQt+kt+cq0pXCT0A6dSRAMY5Cz1QkSnusyo=;
        b=gJxY+sstoKF3157dgExAw7u35sGcpyvt+MJxOV4GULyzUL3V3rDMyfKnWnxXe8pdnQ
         0pJXdgz5Bwd+Nbfpvk1q4/K9mwO9sokpl1p7XpskiKtgpoWQYS8d8Zxg5XOaacmfN5O/
         dW09rqGPhNaBD+/iBJEG0X4Vrb3I1vVWpOLCSQgG3PXH+zONd6OCeY0mLHhUuJn1Z0QK
         7o3s4xzyslZujM2W/CvO1emx/LalaZKmQwizlRAzbtW27J7obxr/Jp9M7Sj4fybi8y7t
         A+xY7Jc9CZx8l4d5Kq2G3KI7hL6hHci5L1cjxikFKJwlA3kxc41dNi39iy0JfVqOjcBX
         ZVRQ==
X-Forwarded-Encrypted: i=1; AJvYcCXsmUrKL7d/B64dvWLFYqZsQlNinM9x9oUePpSotxH3kfF54QTbRsby/MYc8T2EmhH8nltM+o4=@lists.infradead.org
X-Gm-Message-State: AOJu0YzKHjpShW0XOFjOed8o5//vIwYLa/RTrDsxTBbhJwgxLt4oXUFc
	dm2uh7rFZM5uU/cjQMYVBoVp4WZ7VFH0BAcTqlEfQz8ZC5MBVvtojZlzfb2Hc7tUVQNx6U8gEcG
	fZTH40TDr47vQw6/qfNFvPY3vUc4+zCADC8hPGLCiZZIfs5913+V4XWmmx5jQ
X-Gm-Gg: ASbGnctBarsji5MNI24Re+xsupBUZQ+MlCZvCyMRlQszi8qMsaJ1F4mCXHdvaGp1KYy
	iywPgHaOcnexZuk0bE0ud9Ewcb9AczVHRScVGJecgl1dar1i4llyF/yQIMQjBEv4Mk0e0dy8Osn
	2o4JdeoaoTIdq9abU53WKEc2BVMAO2tz+xq7iROJFEdTe/vNd1tRD1hmFjJ56X91CPsw+WRIQol
	CLBoUUD4NQ6mxraOX4pvLAmEFPeC3jZBkF+aR1tzMZ1ChyFAsuRTAq7eqK9bo1DPcUAm9G6i92p
	5ppYnBW2PlB4mK5xd+w3hfesp1c2
X-Received: by 2002:a17:903:2d2:b0:216:2804:a241 with SMTP id d9443c01a7336-21c355bc154mr313958985ad.37.1737541026230;
        Wed, 22 Jan 2025 02:17:06 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEEmXtURoe+Ng6d09jVMyegZJR+EK6+rHg3L49Dl1tYGgiNBdN3LUBKDKExgURvnWklmTb/vQ==
X-Received: by 2002:a17:903:2d2:b0:216:2804:a241 with SMTP id d9443c01a7336-21c355bc154mr313958635ad.37.1737541025845;
        Wed, 22 Jan 2025 02:17:05 -0800 (PST)
Received: from [10.152.202.18] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21c2d3acce3sm91808995ad.119.2025.01.22.02.17.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Jan 2025 02:17:05 -0800 (PST)
Message-ID: <1c25d032-894a-47d3-9d7c-a235e73af9ee@oss.qualcomm.com>
Date: Wed, 22 Jan 2025 15:47:02 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 3/4] wifi: ath12k: use correct WMI command to set
 country code for WCN7850
To: Kang Yang <quic_kangyang@quicinc.com>, ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org
References: <20250121104543.2053-1-quic_kangyang@quicinc.com>
 <20250121104543.2053-4-quic_kangyang@quicinc.com>
From: Aditya Kumar Singh <aditya.kumar.singh@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20250121104543.2053-4-quic_kangyang@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: kwu79KUaul20CgfMoVy7rPsM8-h6tGtF
X-Proofpoint-GUID: kwu79KUaul20CgfMoVy7rPsM8-h6tGtF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-22_04,2025-01-22_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=999 bulkscore=0
 suspectscore=0 mlxscore=0 phishscore=0 clxscore=1011 priorityscore=1501
 lowpriorityscore=0 adultscore=0 spamscore=0 impostorscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2411120000
 definitions=main-2501220075
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250122_021707_623602_2C3F1B63 
X-CRM114-Status: GOOD (  13.35  )
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

On 1/21/25 16:15, Kang Yang wrote:
> From: Wen Gong<quic_wgong@quicinc.com>
> 
> When userspace try to set country code by NL80211_REGDOM_SET_BY_USER
> hint(like iw reg set XX), it will pass new country code to ath12k.
> Then ath12k will set this new country code to firmware by
> WMI_SET_INIT_COUNTRY_CMDID. But for WCN7850, this WMI command won't
> take effect.
> 
> For AP based chips(QCN92xx), WMI_SET_INIT_COUNTRY_CMDID is the correct
> command. However, for STATION based chips(WCN7850), it need to use
> WMI_SET_CURRENT_COUNTRY_CMDID.
> 
> Add flag current_cc_support in hardware parameters. It is used to
> distinguish AP/STA platform. After that, the firmware will work
> normal and the regulatory feature works well for WCN7850.
> 
> Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0.c5-00481-QCAHMTSWPL_V1.0_V2.0_SILICONZ-3
> 
> Signed-off-by: Wen Gong<quic_wgong@quicinc.com>
> Signed-off-by: Kang Yang<quic_kangyang@quicinc.com>

Reviewed-by: Aditya Kumar Singh <aditya.kumar.singh@oss.qualcomm.com>

-- 
Aditya


