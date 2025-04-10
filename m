Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01710C3601E
	for <ath12k@archiver.kernel.org>; Thu, 10 Apr 2025 22:17:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SlD2Zoqck4pcF7VZMBOHU/52fauKubtGQptlE1KvI3Y=; b=AUZbrSn0rNnfw03oLgzXNfl2zz
	fwuFVM1MmLb1u1m3UlZuiHpU6Wk6YH+UyOSv25/F7fRy2QRm99VsLvxGVGFZQvHyA2OSfXAjaGnAx
	emhafG4VWf+FtdBfw/CYYTsqm0HJRyonwr7epG+Pph3CRICw0O4Yep6eYFMsmIx1rTV32SNN3gFVD
	ocQv7NYuZQrrXiEHPBaEZ9z9FBNvqSLXNNqVAxANY2te9F07qHDYe087N04fwn/yZb8lTp9qjqjOg
	Ac5aE6A5252gtFjvbtC6x5oTDTfmHODo8mCOfjg1uxfwMD429C2A05XHNhQJtcIDeAgucIhkMqXHR
	/qOhDANA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u30Cj-0000000Bx47-2cFC
	for ath12k@archiver.kernel.org;
	Thu, 10 Apr 2025 22:17:01 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u30Cg-0000000Bx3j-2tXM
	for ath12k@lists.infradead.org;
	Thu, 10 Apr 2025 22:17:00 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53AFiQTm018639
	for <ath12k@lists.infradead.org>; Thu, 10 Apr 2025 22:16:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	SlD2Zoqck4pcF7VZMBOHU/52fauKubtGQptlE1KvI3Y=; b=fsCz9ImP98FsJt01
	ASFcaidgTI8xN0WzSjLgQk2ozYggU+2fa2BXmRSCgo3b9J67QXlm03nEChTMn6mK
	Bo3cpQIsU4gwA+Ls23trtcC0TGgdrDoQ0r1fC18gAqpfHejLjXu5l9LI0kpKX/di
	lxWxmnHK6r7PZrYLv5Ro6WZTZ7Pp1VddGk3CVqqG8w7L0380ZxgcJfclQlaadTRx
	guB/S+VXx5JlGHgUB8gjSjlPqPz7BKcgTAS/9rznOWIQMk+fFwKXXFN3moMrYKLd
	jyoJcrY3hHioBBLdDczXT8iPgMW2iFfM/qxB46DYQWU2yoXmPdZHt1MTe6LcnkeB
	sM5JnA==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45twdgrmru-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Thu, 10 Apr 2025 22:16:56 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-306e5d9c9a6so2248827a91.1
        for <ath12k@lists.infradead.org>; Thu, 10 Apr 2025 15:16:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744323415; x=1744928215;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=SlD2Zoqck4pcF7VZMBOHU/52fauKubtGQptlE1KvI3Y=;
        b=KNEjlQ3WD+/peHoGc3NW5xZ3aZn0xDCKt6m0R13RT+weYNd3dzzljmQKjIVSSbHJ2X
         jCVv4HYEy8I+j0pOfvF8RPbsrtDCWw46QaiMTW9O2BoO5zoSOL7wktzt9asXH1dJ1L9I
         p0yK8LAaO/dTTrRzygVrJXd+L+C+vm8ZgqvWU2foYE1LXye3OaeMh131XPYcdlQstFjB
         aLKf36fwZT2WX0dsM6MU9h4bOaYFzzLU3vUpOUJFUjWESPuQCVKHU47o/v7t9O5DBn4+
         YBP0Q3c8ny2D9t3/JcKCLzAcVEb0siXzKhUQBPQGwjXEVqI1gL/psHFZ8Z0Ovc5bD7GL
         tgwQ==
X-Forwarded-Encrypted: i=1; AJvYcCWABKFM/I92iV2n68S9wK1cCML2pAdY7kFkiadEZtq8eRmc+P+Wud4XH0uV4C7iDYmtyVX5/ks=@lists.infradead.org
X-Gm-Message-State: AOJu0Yyn8BXIXkkspRdT4aL/vje08DdW4ia6wM7DnlfkqJgyjKOfc3kc
	EFcXMuC/TfaZ2QnKuwq6DnZlTPiM0UhyklwLNb95tcGFS3yWV4QdyDcNGxewXmnu+O8yAGNnJPJ
	gCsWODm7bXWMhDz48CITpjzEKp+HZvKLeYN5ZlYarnUAnkezKU4SzCG+cnD46nthd8NYn
X-Gm-Gg: ASbGnctA6fbP0XkMdOP4QkXZO1pN4pJdqg0ACwgzBQOWXMqYs+jlMcReHwADLqbVtRH
	RClK3Da2MzKPRogLA23kWrNSkvCBrHLpkpOpJ6HjyNDYGrTZabI4kwfg7QsBWujwEOFW9Aty25R
	16fWfDalv1/8I6qhdgOZ67j6leJXDWBHBaRWLedGqK3uuRd09uobYqDWmGFvB2uWBPtXCDnSkv2
	/PV8b2HguxAxFMoEUuO3krg3Dc6XXf9PBKwM+SrdyrwOg+fCUHwXxA5heD7grfIK1QqueXe4AFR
	ocbR9dRxUBRijvdcfVHQbanhj7VVHKSHG5SUeloCYfm9edJtL0WHQa4VaYDB081hp6OLcW3tzT5
	wXBqO
X-Received: by 2002:a17:90b:2743:b0:2fe:b174:31fe with SMTP id 98e67ed59e1d1-30823624700mr846387a91.2.1744323415423;
        Thu, 10 Apr 2025 15:16:55 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF3q3badw0zIeHRu251yR5zxmnm+DYdPJGS2wgnmZo8bCO06H0BLiRjTFsUKI1g39u/REbl2w==
X-Received: by 2002:a17:90b:2743:b0:2fe:b174:31fe with SMTP id 98e67ed59e1d1-30823624700mr846343a91.2.1744323414953;
        Thu, 10 Apr 2025 15:16:54 -0700 (PDT)
Received: from [192.168.1.111] (c-73-202-227-126.hsd1.ca.comcast.net. [73.202.227.126])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-306dd1859e9sm4265767a91.43.2025.04.10.15.16.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 10 Apr 2025 15:16:54 -0700 (PDT)
Message-ID: <23e31f9f-4465-45c1-8919-c5d43034d33e@oss.qualcomm.com>
Date: Thu, 10 Apr 2025 15:16:53 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] wifi: ath12k: Fix buffer overflow in debugfs
To: Dan Carpenter <dan.carpenter@linaro.org>,
        Dinesh Karthikeyan <quic_dinek@quicinc.com>
Cc: Jeff Johnson <jjohnson@kernel.org>, Kalle Valo <kvalo@kernel.org>,
        Ramya Gnanasekar <quic_rgnanase@quicinc.com>,
        linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
References: <35daefbd-d493-41d9-b192-96177d521b40@stanley.mountain>
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <35daefbd-d493-41d9-b192-96177d521b40@stanley.mountain>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=PJgP+eqC c=1 sm=1 tr=0 ts=67f84358 cx=c_pps a=RP+M6JBNLl+fLTcSJhASfg==:117 a=e70TP3dOR9hTogukJ0528Q==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=VwQbUJbxAAAA:8 a=eavArjg6gjGuu_xFX0IA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-ORIG-GUID: O7J2jsNcaXv6OTgrEqKKoVu69kNyEJpW
X-Proofpoint-GUID: O7J2jsNcaXv6OTgrEqKKoVu69kNyEJpW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-10_07,2025-04-10_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0
 lowpriorityscore=0 clxscore=1015 adultscore=0 malwarescore=0 spamscore=0
 impostorscore=0 suspectscore=0 mlxlogscore=779 bulkscore=0 mlxscore=0
 priorityscore=1501 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504100162
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250410_151658_870294_80623B7E 
X-CRM114-Status: UNSURE (   8.28  )
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

On 4/9/2025 4:01 AM, Dan Carpenter wrote:
> If the user tries to write more than 32 bytes then it results in memory
> corruption.  Fortunately, this is debugfs so it's limitted to root users.

I've fixed this in the 'pending' branch:
WARNING:TYPO_SPELLING: 'limitted' may be misspelled - perhaps 'limited'?

https://git.kernel.org/pub/scm/linux/kernel/git/ath/ath.git/commit/?h=pending&id=b49ee0380e07efa34bdc4b012df22842b7fe2825

/jeff

