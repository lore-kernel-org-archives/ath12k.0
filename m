Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41D73E77188
	for <ath12k@archiver.kernel.org>; Tue, 14 Jan 2025 20:56:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rSzsf5GHYJVFifVSYbpjTRWf1wVywB5kddjOvlnWrW4=; b=qLGJqpHoOfzenzlyRu/jD2KnDX
	O20Bk2BMtEyHuwZMzDNZDf723are0f8sKl7ieVRxhLMqhtADJWq6G0S9gC/oOh6xeBjS3iyxQmkWB
	CsX++ggGdW0aTBcA/ZcN5kg/gUAfApNv1tndv4I9vsHN0jREiL12NfPKmY38fAJyAa7s8Ud/TA3XL
	zPxAQkmce7bGfo92E+eW2gzsE9wWdfljleBPhftIihtBYlf2zuHk53712ozG9Tz2vilh/x8orKaWe
	9smqEXpEFPf9g0ZOP1QoX/AYYLIbqDWpOhFzJo380j+DL6JEye9bda7LnTNw2FdIH0Oq5O+1urzUW
	dXG8REqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tXnxg-00000009kdY-40d4
	for ath12k@archiver.kernel.org;
	Tue, 14 Jan 2025 20:56:32 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tXnvT-00000009kD8-0T7p
	for ath12k@lists.infradead.org;
	Tue, 14 Jan 2025 20:54:16 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50EGihJ2007997
	for <ath12k@lists.infradead.org>; Tue, 14 Jan 2025 20:54:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	rSzsf5GHYJVFifVSYbpjTRWf1wVywB5kddjOvlnWrW4=; b=WY+3jOhevpCVr2+B
	NsCUsKZm8vjq1cGT05TZc8k7hkiogRFGEIrWWk3iRCyN0xwWL+lEqX+y7QKFWFft
	Dad83qrPgVQEAynTIf23TYAiUHv9TfcwQRrhoqLA1BkKassO+VQLDVcyKYDCEfGR
	Cp7kDfPszmgOBpFAiAPc9+tWvPMdornNxfZh/XIbwbqH5m9gXDnppHEiQBU/cD7i
	/e+He11czY594aSg7rXySWDUQivxxaFG2tpOkiaASfKOXM4r027RGEkFMoqR3uxw
	F/C2yPp3wjZUgmZxcu2WAOMU7zSUSsi5OkP4Ri0IL2WX5wy6K4Dci3u22hSEeWYA
	QXD1rA==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 445uqe0hq2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Tue, 14 Jan 2025 20:54:13 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-2ef9864e006so16632111a91.2
        for <ath12k@lists.infradead.org>; Tue, 14 Jan 2025 12:54:13 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736888052; x=1737492852;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rSzsf5GHYJVFifVSYbpjTRWf1wVywB5kddjOvlnWrW4=;
        b=TzmLTBYveUZHibvjbsrXXO3QXS4k1o0D3gxozIKoiZpBhc6LCoDSsuL5XegXlIZVaQ
         2BL5IsOrJ8Bpy1AHYUvGK9w0pcaTgwWeFqVQ4h5pumYQ9ZB/YXV3yPJ7Cfk01UhN7Z2T
         Iga8LRPmbWIehkuyu3ZLs9WQ/b2qGgPtuFu9JDI0A0FnZBBXUQpVxQfjST0cdogeipnV
         ddTpBTaWQDRHin1aBZJWLhO5ymVKQfAxk2EUwOpbtcbOij2hLsjC03+YYz9QUNkG+kkY
         HFfLPeVmTeZQahOJPTx8m2/INaHfU+i6YIZiVh8YvpahOjOHxLgcwEPWy68xJvqfPRMj
         DnWw==
X-Gm-Message-State: AOJu0Yz75zB8mdREzPyfcg5no01xPz3qPlP7J4ELCfTkmAd372mvKJTA
	w/VcfLWMbmqaLWzBvKk735mC+FsN1+V/0z85kN94KBQUlKnY1OFH0YEJHjyjCnZgm92h3qXaDad
	YELQGmqIWR2zPwzp7r7QEcw9vZdxC7f1ujdMzTsZQaiwzaxnsaxh8m9L5EfDgx7Xap7YR
X-Gm-Gg: ASbGncuT+fsgLCdZpRqR6eLvVDtOuNa+vB+/nV8S6KM8At5AbWCfwSRdNCkIWoQIzEv
	7Gd6JCzJzKTJ6MGMahUbE/N5VtNq+nuiWKcSaJzKGzp6/xhaM8y2ktAJQ23e88rE1bWSbWlVQZe
	xLhk57N74nkZyyHmfTGRvFcj2z+peFuWTfnWURm+dEziVOdUZATDUvUWy8Bomy0wQa3GiZHB2nZ
	X8cMaXhn3Xj8MCRZWhP4r7KzOs7sWQRmX+Gj8VT5dy8Xu1GG11LDB+AtyUncgi2aOP69kSUgIXM
	YfDsqBpiWnXZaeFa2w==
X-Received: by 2002:a17:90b:538e:b0:2ee:c4f2:a76d with SMTP id 98e67ed59e1d1-2f548f59a46mr34824926a91.21.1736888052567;
        Tue, 14 Jan 2025 12:54:12 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGyum94fkerAe34rcqee9zya3zT22ZWhlH6+QOJIs82IS+WVRink3onr9PAiSGGBm5M7gq2uw==
X-Received: by 2002:a17:90b:538e:b0:2ee:c4f2:a76d with SMTP id 98e67ed59e1d1-2f548f59a46mr34824909a91.21.1736888052186;
        Tue, 14 Jan 2025 12:54:12 -0800 (PST)
Received: from [169.254.0.1] (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2f54a2ad3b7sm12138463a91.31.2025.01.14.12.54.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jan 2025 12:54:11 -0800 (PST)
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
To: ath12k@lists.infradead.org,
        Karthikeyan Periyasamy <quic_periyasa@quicinc.com>
Cc: linux-wireless@vger.kernel.org
In-Reply-To: <20250112071630.4059410-1-quic_periyasa@quicinc.com>
References: <20250112071630.4059410-1-quic_periyasa@quicinc.com>
Subject: Re: [PATCH v4 0/4] wifi: ath12k: Fix the static checker warning
Message-Id: <173688805162.2759377.8404061947249707120.b4-ty@oss.qualcomm.com>
Date: Tue, 14 Jan 2025 12:54:11 -0800
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.0
X-Proofpoint-GUID: jVmf_zpGmFFjRTW0T_Zs5afqvd1zusXr
X-Proofpoint-ORIG-GUID: jVmf_zpGmFFjRTW0T_Zs5afqvd1zusXr
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-14_07,2025-01-13_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 mlxlogscore=622
 clxscore=1015 impostorscore=0 malwarescore=0 suspectscore=0 mlxscore=0
 priorityscore=1501 adultscore=0 phishscore=0 lowpriorityscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2501140158
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250114_125415_202570_8D8EC2B5 
X-CRM114-Status: UNSURE (   9.83  )
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


On Sun, 12 Jan 2025 12:46:26 +0530, Karthikeyan Periyasamy wrote:
> This patch series fix the below Smatch static checker warnings
> 
> Warnings:
> mac.c:10941 ath12k_mac_destroy() error: we previously assumed 'ab' could be null (see line 11348)
> mac.c:11007 ath12k_mac_allocate() error: uninitialized symbol 'ab'.
> mac.c:11013 ath12k_mac_allocate() error: uninitialized symbol 'ab'.
> 
> [...]

Applied, thanks!

[1/4] wifi: ath12k: Refactor ath12k_hw set helper function argument
      commit: 21261e4d564e866bdae810b4fb5278a3a6a1a6ed
[2/4] wifi: ath12k: Refactor the ath12k_hw get helper function argument
      commit: 812a30271d48cff5edc39aeb436b3bebd558f5cf
[3/4] wifi: ath12k: Remove ath12k_get_num_hw() helper function
      commit: 54fcdcf07baa9cb34359094f1b829b29d0845cb6
[4/4] wifi: ath12k: Fix uninitialized variable access in ath12k_mac_allocate() function
      commit: 4aae869847ce50da902005ce4d84505d54e739c9

Best regards,
-- 
Jeff Johnson <jeff.johnson@oss.qualcomm.com>


