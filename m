Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE47EC02180
	for <ath12k@archiver.kernel.org>; Mon, 13 Jan 2025 19:25:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Lz34Xw3X4pr4DZA43rFUVWHHhjQk9s60FAWJ/bqHi0A=; b=aGQBRqQQtZkBuN/ro+kLQD57O/
	VGWquNLq5Z7UwE6xH2zCzf4r05DCdb/Gg5lxnxrOiYjEjkYSrlNoV2yAoHxUDGt5lcebNCvhBgUsx
	oQDRM63CwHVD37nY1I7rYK5ia14YrEDDrh2NqwvOLs6pRzGkwD7MZZKYFmB65/s9TOSmK6VxkdS1f
	MWH5bd/IVce7hTMc3oFicVtM5pwI8CNcZWkSBJX8WWsHTUA6ZYp+91a0lpzfxBm6NQwybP6J14v1Y
	Q1XQoJq14rlxa/cvEyIntSZQeSGYjULzt2lwZ4puz+XRzxSxFlvxuIq3J+qfFwZAdo/H0mbqRkg8+
	i68OdfjQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tXQ4R-00000006N6S-2iiv
	for ath12k@archiver.kernel.org;
	Mon, 13 Jan 2025 19:25:55 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tXQ4P-00000006N63-1IzB
	for ath12k@lists.infradead.org;
	Mon, 13 Jan 2025 19:25:54 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50DIio4q007922
	for <ath12k@lists.infradead.org>; Mon, 13 Jan 2025 19:25:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Lz34Xw3X4pr4DZA43rFUVWHHhjQk9s60FAWJ/bqHi0A=; b=GlvDxaH0g+9AZ3TJ
	xg+L3dX/5VpW2802mQ0uNVWgpIKQcVoZv1/cBCx6L/YPVGk52yiia6ciVKEkqMkt
	KoivWKPACrP2x354SCrbAUd6RTFzH00N5t87yNk+/FmP4as7MEEbMKElpaKCc2CQ
	sxMrx3IsOeCmT4pLSpPGkxS3hNklakxecnA+MWHkAyM3ZDMwlNn65bdHruE8DXuD
	YXviuBp7R5U62Bf2jNRw36IRn2cbL7gj4SLKOj7rJxIwUrzy+Lr9aWRJ2ecZspbk
	rJNeW1s116yPvHj7eajg1Jgn7QYAVE2DYIFjdKMiGm/WZ1nkcGEAi+R5a4wLWiaF
	rtttMg==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4458cn03qh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Mon, 13 Jan 2025 19:25:52 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-216405eea1fso85669775ad.0
        for <ath12k@lists.infradead.org>; Mon, 13 Jan 2025 11:25:52 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736796351; x=1737401151;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Lz34Xw3X4pr4DZA43rFUVWHHhjQk9s60FAWJ/bqHi0A=;
        b=YgJRC+IQBDfTF/2HBSCHPSLDrXIBqksklBZe0T4fdyMzVe7cEoqWnldp0tyY6GHaeD
         Po0+iLLP7hpUQZfbaZBg8IJjUPGZfOgqXUjBhyya/Dtc03I0KSznrXcF62sx3AInwXNh
         kWkvlCO7Blr/aXexJiZ++Sa5TMXpAKQMFkll9+2JwJOMgtEvCQyWlViD5M2Zwix7liqC
         NuqURLuJUNUGmIayIuRtHyv0Ydc1zunoHaEKr+n7QqoFH4Jts81Mm6n4Wqh8KFQiMkQ7
         lPwS2nTNj3lvWeryg/0CnGemPa7MYazqRj/tWaAr0mxzEd9OJQwQgrAbyLORuWAiBS/p
         fr0w==
X-Forwarded-Encrypted: i=1; AJvYcCXvra+PWFlhrRYz1jyY3irWiqUbChTqhpNdxP3ho3ZlQir5kbT8fME/ZRSCFGzUPq2K8slNmXE=@lists.infradead.org
X-Gm-Message-State: AOJu0Ywz1ELa0QRAShoj+M6LonoHfe14fG9hC0ZEVK/lH4CD7J7S1aIL
	Uy14vMoOitmV3cSwELafSkM2kFE/nGpTYjfTa/vndVSWiNj4hG7BmMpiiBSAK43YOU6JLspz5z4
	CPL4QKwiyYnttpAMirbZKB8PVAeMTlNvA6/9mKhuawNXW6NJoWegkCORSFpe1
X-Gm-Gg: ASbGncs1nH+aeVfA+ahOQNZgXRT+zPfqwQz7Kjj8T/id3JL8OndqkfBG1JnpkHe3Y3R
	QsOSA5/fzx/V2uhgYtAsThu8ctpr2AhShkckPFjDnXHWSabiHUIbBwxqWbhPftT48c4x4vPjC6g
	eJO8wKhZhVt4+1groYNDnz6Rw5YQ8SoOdUWOUJvUzQ4C4Pg2gUr61hy8UbmTVXt6J1nTK6PKr33
	WW4KkGwcqozsywMqf35VX1FKf+TeFqSBce1eF5Vn9Bcu1Xj33aP0xD2nS4TrAeZwSQldNOEnjOO
	0Tm5670Fr7KDIt+lVcik9BmJ2Md1pkC6T+M0UtThqCQ91k9TLA==
X-Received: by 2002:a17:902:f54a:b0:216:2426:7668 with SMTP id d9443c01a7336-21a83f4bce1mr244800205ad.13.1736796350908;
        Mon, 13 Jan 2025 11:25:50 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFLpebPF/QX+eZca/ElBLEy2ZhA5voD5qQJNkfygzbLSge2xYPad5A1qUYhWuTSY9XvssJUew==
X-Received: by 2002:a17:902:f54a:b0:216:2426:7668 with SMTP id d9443c01a7336-21a83f4bce1mr244799945ad.13.1736796350513;
        Mon, 13 Jan 2025 11:25:50 -0800 (PST)
Received: from [192.168.1.111] (c-73-202-227-126.hsd1.ca.comcast.net. [73.202.227.126])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21a9f254040sm56419705ad.232.2025.01.13.11.25.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Jan 2025 11:25:50 -0800 (PST)
Message-ID: <95825ece-cb16-4010-b189-092c39b6a7a5@oss.qualcomm.com>
Date: Mon, 13 Jan 2025 11:25:49 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 10/10] wifi: ath12k: reset MLO global memory during
 recovery
To: Aditya Kumar Singh <quic_adisi@quicinc.com>,
        Kalle Valo
 <kvalo@kernel.org>, Jeff Johnson <jjohnson@kernel.org>,
        Karthikeyan Periyasamy <quic_periyasa@quicinc.com>,
        Harshitha Prem <quic_hprem@quicinc.com>
Cc: Kalle Valo <quic_kvalo@quicinc.com>, linux-wireless@vger.kernel.org,
        ath12k@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20250109-fix_reboot_issues_with_hw_grouping-v1-0-fb39ec03451e@quicinc.com>
 <20250109-fix_reboot_issues_with_hw_grouping-v1-10-fb39ec03451e@quicinc.com>
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20250109-fix_reboot_issues_with_hw_grouping-v1-10-fb39ec03451e@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: M7pMeUarYj8QdqCSO8-1J7KaFQwDFVqM
X-Proofpoint-GUID: M7pMeUarYj8QdqCSO8-1J7KaFQwDFVqM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 impostorscore=0 phishscore=0 clxscore=1015 mlxlogscore=998 mlxscore=0
 priorityscore=1501 malwarescore=0 suspectscore=0 spamscore=0 bulkscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2501130155
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250113_112553_477778_5769E8CE 
X-CRM114-Status: GOOD (  11.70  )
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

On 1/8/2025 8:25 PM, Aditya Kumar Singh wrote:
> When operating with multiple devices grouped together, the firmware stores
> data related to the state machine of each partner device in the MLO global
> memory region. If the firmware crashes, it updates the state to 'crashed'.
> During recovery, this memory is shared with the firmware again, and upon
> detecting the 'crashed' state, it reasserts. This leads to a loop of
> firmware asserts and it never recovers.
> 
> Hence to fix this issue,  once all devices in the group have been asserted
> and powered down, reset the MLO global memory region.
> 
> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.3.1-00173-QCAHKSWPL_SILICONZ-1
> 
> Signed-off-by: Aditya Kumar Singh <quic_adisi@quicinc.com>

Acked-by: Jeff Johnson <jeff.johnson@oss.qualcomm.com>



