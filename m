Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF045C54FCD
	for <ath12k@archiver.kernel.org>; Thu, 30 Jul 2026 03:09:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2m0/BtdRgV3NUxbDOKh7ojCOHm73mLPU2prtdT91/us=; b=KQjYTVhTsrVMp49QJuhFPUMXyu
	Orl1euRdPNk1a1Svm31jMRVZpy8+c0iCRSrL1sqm0HD/Jd4v/yXEtNcrFAe6SwxB7MN+8QLVkRgse
	zp9YSuGMHHUS3IztF+s9XOH/CJ6pXzZokbhSte0AuG6Es1ZYK05iYLb1rZdKR4FiX97h+TKEBMnyw
	rL61PMfDRZdAE9mGGuHojk6J3vgYO6T1qEZmzyruxdejOU2cr2xa6aWTDpqCjxUaR6+hvx73XvrRu
	1JnzoILsCyU3TeG+ANqGbf/Z7Klx6c0mvsXBtxpH78P6qY6vmhyZRxXB/RCB0unP4bYJHV2UajhXm
	SkGuQ23g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpH9a-00000009OIN-1RTo;
	Thu, 30 Jul 2026 03:09:50 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpH9X-00000009OHz-3vD8
	for ath12k@lists.infradead.org;
	Thu, 30 Jul 2026 03:09:49 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66U2CSon3644208
	for <ath12k@lists.infradead.org>; Thu, 30 Jul 2026 03:09:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	2m0/BtdRgV3NUxbDOKh7ojCOHm73mLPU2prtdT91/us=; b=Y0lIf2OTDnZMafJd
	winP9FCSBPirWY/GumfPqMxeNgNledpAL0rdzHZkrN5VHHrEBl944YPTWtuH26Gy
	fSJlZMlJ+OFdtqR7CeTRLM49JBzpt5WZYzOISLQA2sFJTIF7vIcP0cZuEk2am7ed
	IKom/IqAi4ORbKgoEZx+Jn0aZEVTXATSetmT+6cVROdIwloRnRc3muYdhsddu/Yz
	RtyFRv2Tm6i5u4j+IjbFvI2W3IHMyWdcCLurs+wnMNosJPyoCGAzOq3eY8Zt5AAg
	obhnjTRd17IPYrUVs69SR11qyvcj4S42+Ds6cLoC2JjYHMrHku5dMNzpVINdEWVf
	ukSvNw==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fqwmfr6aq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Thu, 30 Jul 2026 03:09:46 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2cc6dd43737so36980085ad.2
        for <ath12k@lists.infradead.org>; Wed, 29 Jul 2026 20:09:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785380986; x=1785985786; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2m0/BtdRgV3NUxbDOKh7ojCOHm73mLPU2prtdT91/us=;
        b=ftqh9Rn1z0QGtv78tH0fFYTyGlg9us3NBc2/jnWhRTd+X0Tr3KVOXV8muIxcBfv+a9
         fiJAU4M5S3+xtnfuaQ0CnY8BJPobrt0QIwTwvjvaziFIRQ54sb2w3b0zfumQGJ5/3YHr
         3LD7z6FD7dQ3UtNYBnncKrbdKftW8a5DCFSIy9T7TQXVRAbtEnS6YApR1ldLz/4HEZud
         fOzUkMMyOVIsdrwizXwBbZROh6bvmR1RQyCe0GLFUWqhl3aj+daGr87aQweBQ37vlCBF
         8qUxCFpLZRVo4QcfJY8kfTb4SR12DB6fwQuQ0lw3Mk8sFp4f1R6Mb8a8m4/mKtVfV+Rj
         BkHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785380986; x=1785985786;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2m0/BtdRgV3NUxbDOKh7ojCOHm73mLPU2prtdT91/us=;
        b=tXZeECc3YJ1sz3kZJpdmMq9zmpf1jOxT5HgFIxleTS9zghHkcqFmXMGJeaNA7i3bDs
         iDb5S85H8WJ/eI12xVFzU7U7kCO8KwPfGEvba20AAWnbb0dUjIUzp/QeRRXGPrw0tvPQ
         yuzhbBMcSTVPnrlZ5y0uVt4SfQlFoUMCzyR66MpahaYNj3ERBNrwYYWOsv1+pMcwOWkH
         dk2Yaln97xeadh7XCFBW9hPAVxbOdG9MzPODp+T/9im6M/tb7j+ghPvmRZAlVaMB6f4q
         vZWIlxsmJ4OqxBEAyVGQL/DjqTWM7cVPYFYd+UXH5HBRQOy02QQ0QvTuakJu40dPUnWk
         m8UA==
X-Gm-Message-State: AOJu0Yx41FsOs3VRoRU+WWyJo+tqQBCpQ/CkFIPkTCSqhRyczdUIn/PB
	pZDf9MvWqU5fniC5zJepBx58mu8b6J9k0NVw/HZyVI+UzV+Hi1iEn6/5wv8/eEqzbH1JZrOPxF0
	THyCvfCxqs2fJpNmRarPpYk+moL7HS0U7TNp8XfeOuQiM4ika7P0JfeWYfCvNBvzO
X-Gm-Gg: AR+sD1017YNMnk8Qm6r2goLLg3M7EvlThCZSg4RhhxSeo3AnPhMcsKUS8/uFI6hTjsa
	szSy22i4XHIu3zPPAnQ4dLclbLr+T1cLesBkRB0JnqmDhTYaIcLT7TqYN/9eoNDpPkCGSCenNtm
	bBfI15JulRLsVJe9BDPC81dt80+pO/IOcPbcdeeTGn+I7t0ajgDKaCNdR3rmpN0Ttytw3J6xaW2
	M8gv5tLFX+jY481Z5svKHaz/Os4x1VwCXHaPBF+uB/x09sPVAHTVg526T7EwgPGmk6C9WUzHN7E
	Nmy72pjlcUdTV+HCPeFmPBlXU/Vug1NYn5w84L04tiJ06gfYJ8C2GeT6A/ivIPbrALnaA0aExhq
	r7uztOqM+d+r3aM1eaaJmnx0ZJTpE0GdpT+CnX8vleMlRXavx19GtXMKIdPQWRBOiLNJcuQs=
X-Received: by 2002:a17:902:cf03:b0:2cc:f5aa:9513 with SMTP id d9443c01a7336-2d035b8914cmr9095825ad.10.1785380986080;
        Wed, 29 Jul 2026 20:09:46 -0700 (PDT)
X-Received: by 2002:a17:902:cf03:b0:2cc:f5aa:9513 with SMTP id d9443c01a7336-2d035b8914cmr9095655ad.10.1785380985658;
        Wed, 29 Jul 2026 20:09:45 -0700 (PDT)
Received: from [10.133.33.58] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d022a16987sm18779785ad.16.2026.07.29.20.09.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Jul 2026 20:09:45 -0700 (PDT)
Message-ID: <f04d4839-c3a8-47b3-8ac0-00ded3ec2905@oss.qualcomm.com>
Date: Thu, 30 Jul 2026 11:09:41 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH ath-current 0/3] wifi: ath11k: fix QRTR readiness related
 WLAN initialization failures
To: Baochen Qiang <baochen.qiang@oss.qualcomm.com>, jjohnson@kernel.org
Cc: ath12k@lists.infradead.org, linux-wireless@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260730010505.143458-1-miaoqing.pan@oss.qualcomm.com>
 <ce9e9251-8b92-44bc-9807-a527524d3415@oss.qualcomm.com>
Content-Language: en-US
From: Miaoqing Pan <miaoqing.pan@oss.qualcomm.com>
In-Reply-To: <ce9e9251-8b92-44bc-9807-a527524d3415@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: AfzrlB__-vuDFZS59kd7e-OxHtjW3rG7
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzMwMDAxOCBTYWx0ZWRfX46dddYTDhwv5
 kGT5sVjAQlN8EI7O7SeMQSTNbrRppaMXUfB7ILkX6T4wB/7Oo1/0s3+iNyeY4uIUzYvZpDVFrv1
 Xm6gb7gT+B0bBNeSNzIClw6M0r4HV9X5jy0EcJEJ6mCsqisdLzKHSqj8OxocT53gDfHl80xdH/+
 vXoTuD1WBdZb9zwZYMLnBx0q29vYvEizQ3Gj0tfzPC0hxNSaCzbvDqqZJxUqZ6iB8AlVEfvzwQ4
 l9GtXMp0D9mXaK9340Nz5xSlhNuOev1rCFgCvfU3GrsX5Wa1QREmu+htA5AM7DCp4IoB88Btxvq
 KOZGwVZ5ftT4JxcuY+pXCJMOEJq7V4ylnEVLWpG7Ngm7r+GX8YS8R0BbsTX3PEIgLsLpNz5cj2g
 41pk7Unf14WSRud7OFtYKJa4PDFUHclXg9Uzvm360xRoq9xWF5Itj9rLRd46sU4vJCzu0waMrl6
 y73vuRbjx5naDc+yQ0Q==
X-Proofpoint-GUID: AfzrlB__-vuDFZS59kd7e-OxHtjW3rG7
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzMwMDAxOCBTYWx0ZWRfXwIiKYQNWFA11
 Y3M/5PoEXISId+qqGKlBjceKes32z0aO1t6hgH4zwMiXq79C3UPs9bqAvGnfJPxFt3qsPFZckiW
 K1B9SGKIl04DWT5KJ7TO6/RlT5hUkr4=
X-Authority-Analysis: v=2.4 cv=F5BnsKhN c=1 sm=1 tr=0 ts=6a6ac07b cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=Op1iSC8d4qv81Z_IT8AA:9 a=QEXdDO2ut3YA:10 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-29_09,2026-07-29_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 phishscore=0 malwarescore=0 clxscore=1015
 suspectscore=0 spamscore=0 priorityscore=1501 impostorscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607300018
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260729_200948_140265_530FA76E 
X-CRM114-Status: UNSURE (   7.28  )
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



On 7/30/2026 9:53 AM, Baochen Qiang wrote:
> 
> this is ath11k patchset but you are sending it to ath12k list.

Will resend, thanks.


