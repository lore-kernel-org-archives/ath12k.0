Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC382C83F25
	for <ath12k@archiver.kernel.org>; Mon, 21 Jul 2025 16:47:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1CW4aMaaZ5mImU6JQMmqMB1qlsc8kOQ6Jf0KoRnrtK0=; b=hNxvsJ+uUBzYzZ+Xsm01A17p1v
	cIYf1653Hz58YmrfjW3yCr9bzvTBU7gUwVNIaiPJwHvrSWnSH5VM6Suo+N4yN/5nP4SLb6W7IRAcZ
	CUVN2Q2TUXNzrMi1bV0/5bT48oKxWJC828+x2ByYyFhP104AOWLu1pJPJjSZRcANq0izP9BCZiXDV
	gc91bxeP/STKBdnAEh8AaIVZnr8QNL+/MJ7gHM2o9yZ81JE5wF1UFDGeH4cImi2b80Fq3RRi9Cpw6
	+oKMuBqdmYkVpy3erQMCPND5Ia5XDkAihYob2WFG/yqBkMLyqQ3k0g60ifO3vTT/XiKUNnNYlBuC1
	6BIPq+Mg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1udtfx-00000000EAa-2B7H;
	Mon, 21 Jul 2025 16:47:41 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uds2V-000000001vA-1ujd
	for ath12k@lists.infradead.org;
	Mon, 21 Jul 2025 15:02:53 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56LA8OQP015833
	for <ath12k@lists.infradead.org>; Mon, 21 Jul 2025 15:02:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	1CW4aMaaZ5mImU6JQMmqMB1qlsc8kOQ6Jf0KoRnrtK0=; b=hUeWniR4vW327qsZ
	FRwcFy79FPQcrtbKXEejuP4jwkgxB2HsuPqHrijVh3wN5Q10WVgatyRVkuT8YsmJ
	WR6xbs8C4+dsytZqWSqvRMqAWkCpJ/Fve3+453KV8Ak4azNHli2aCYKCcgxmSQ+M
	UYkFWIRukv/7Sksd2pa6eR3VcFXFVWN3x4/p0xkTaJUJMaJU4Uyt4lQbqtv9GZcF
	oTNu6ySLZkAWXJuMztE40MiR8YL4q24MYSPABU3ksFcFp7NeRBHrw41ekNbO0v7B
	MAWf8NFhDennRwEzPq9oepNjpD51LFAZY9WxekNNrMZZ1Nh4m3RgeJhFm1e8y4ga
	s5zUDA==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 480451dp4a-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Mon, 21 Jul 2025 15:02:50 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-235e3f93687so64623115ad.2
        for <ath12k@lists.infradead.org>; Mon, 21 Jul 2025 08:02:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753110169; x=1753714969;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1CW4aMaaZ5mImU6JQMmqMB1qlsc8kOQ6Jf0KoRnrtK0=;
        b=WgWczFjev+uFI2do+YZzv1YOtmuZKcOl+9h0k8TzvjTFfDk+E8ISHJkfPlpUMHY2jp
         fSoVb3hda9E+Jdt27Gg1LyPgdkffV9ebJy+kP4fR22Ty4oTs7zGvWQWDJhgl5NiUAdM6
         +5FUlfgIi7g1QDrMc1/tVTfOWU/+JsFTFGDQUN/Ohq+ZtEcMwWJryZWrtDnWC/JvPqBs
         GBRB4HaJ910bILpIb+d4QkUfvbzdGLiDwdGfCcgDeyUvZyQbvqhs64mo2SHItjIb95z4
         SyyzfbIifKIXFYlK5XUASoMS/NR/0YJB8W1rTqAW80/TBUG5by8epm5H4FFUT37qXNXX
         T8rA==
X-Forwarded-Encrypted: i=1; AJvYcCWXWUl6gDv0kcVrt2Sgw7Fdx13sj4T203lau0p/1iFyzdRKpnnMu608ku41ZNKTLFnA4n/I+R0=@lists.infradead.org
X-Gm-Message-State: AOJu0Yy1VmYKiEn/St9cwb4HMneTADMdkq3PCPqQ4l9AZUQJ4AOk8e+Y
	JA3KhA9hw9k//Rk4sIfTpCO5ZlgVUoFg6HC1jLXkzUcX8XeFUBv+ogVQMy2IQjhjz78qKej7Lll
	mP9P+UcBuIMM3jADQilcRxMj5NNdrKtKBA6k/RtkqiVlL3gsc/FBa8ygPfCqaKOtM
X-Gm-Gg: ASbGncvSkRAEVYeUDl8CDoZ57b1llW87VmknJsUarELO9pRZuI3rRPmU9ApIhj7Cy/W
	Fxpt8enuiFKLMwe7uuEE8yEVHELnOqYVmfbEJXjWQ5U3TRDc/i+W1d2DmXxOfBiA9Cg4s8jE6hZ
	36mPwYoxmnf/Z0K/tfp/Rey+k4BdwgnvXmqFcQ56g7C0lLzupO/rOfOQJLB+nARAl2AZGs/z8yx
	xkuIALdIZ2t0i7dqTvg9DICtgEHd4L9NVtGk8mN1RQ3Mb7+47C7yrPkz3RIwPZ0vzZuWWPsNp1Y
	rSVuzSBvbW5ItVPi1eXZhhfGZrdQzzb7AQh2cs9+Z2P6kWCrPQgJkaX4nka4XBXdLFzpION9wjI
	gVzW0RUkKtMc=
X-Received: by 2002:a17:903:2445:b0:234:de0a:b36e with SMTP id d9443c01a7336-23e25787fc8mr290709785ad.49.1753110167325;
        Mon, 21 Jul 2025 08:02:47 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF2IYqBemqJkI7bKVlzfLxf9TkkqsVx/A2wifBAHj3ybtLf/ZKbY34M7YL+28bOIZsjriNcQA==
X-Received: by 2002:a17:903:2445:b0:234:de0a:b36e with SMTP id d9443c01a7336-23e25787fc8mr290707995ad.49.1753110165748;
        Mon, 21 Jul 2025 08:02:45 -0700 (PDT)
Received: from [192.168.225.142] ([157.49.224.24])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23e3b6b4a04sm59362985ad.91.2025.07.21.08.02.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 21 Jul 2025 08:02:45 -0700 (PDT)
Message-ID: <3272b2f3-c5e6-7163-d2d8-61e6c81520c3@oss.qualcomm.com>
Date: Mon, 21 Jul 2025 20:32:41 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH ath-next] wifi: ath12k: Correct tid cleanup when tid setup
 fails
Content-Language: en-US
To: Sarika Sharma <quic_sarishar@quicinc.com>, ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org
References: <20250721061749.886732-1-quic_sarishar@quicinc.com>
From: Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>
In-Reply-To: <20250721061749.886732-1-quic_sarishar@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=EIMG00ZC c=1 sm=1 tr=0 ts=687e569a cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=jjkvTE25TcCRIAzKtE2jAA==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8
 a=grRxx7Cr2Ne4EJ9EsKUA:9 a=QEXdDO2ut3YA:10 a=zZCYzV9kfG8A:10
 a=uG9DUKGECoFWVXl0Dc02:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: zyPZRw2BUh5zh-_KDW_fByd_M3ktTP1E
X-Proofpoint-GUID: zyPZRw2BUh5zh-_KDW_fByd_M3ktTP1E
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzIxMDEzMyBTYWx0ZWRfX0vF+uNlGaBCP
 FD3zqbO7glEsh8RU6qpUj6uYPKyt6GLKgunPidocSj8BD7SriAdQhR44luk2LMVw4rIQOBruoxn
 KCWzHh9VvYtb1ItRyI+Ytxthr9U+c8DRo1mdTzbq2qlaadof94jGZv2zoxxBYjR0iHPzMNitIP3
 Sj4isr/PScJUF7sGZMglICQ/uAaj5NvxRgoIV00DbH8JxZjb7nA9JH33+ygDuzYzm1hjWupdvSf
 d0Ljjtnam5Ux1nQmhy02tpFFgY2zeeeT64jCV/ugQei7A3UIxfmdVTaDjz+0GkcV6XA98OZLXJT
 c4/z3jNKRvGGMM/DUn0l4tCs/RnK7oYEfNgPh3kY26qsrcVbviVHkk4SUN/iEvM86OhCrQx4bAI
 0NJiRLUkrEpe5e1nXc/3Tc3OQJ0+8Swx2j8P8iCFSbrr4lGljO8szMQ7kkpZLOYzw21j100K
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-21_04,2025-07-21_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 lowpriorityscore=0 bulkscore=0 adultscore=0
 priorityscore=1501 mlxlogscore=863 phishscore=0 mlxscore=0 clxscore=1015
 suspectscore=0 malwarescore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507210133
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250721_080251_628117_9EB7F889 
X-CRM114-Status: GOOD (  11.09  )
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



On 7/21/2025 11:47 AM, Sarika Sharma wrote:
> Currently, if any error occurs during ath12k_dp_rx_peer_tid_setup(),
> the tid value is already incremented, even though the corresponding
> TID is not actually allocated. Proceed to
> ath12k_dp_rx_peer_tid_delete() starting from unallocated tid,
> which might leads to freeing unallocated TID and cause potential
> crash or out-of-bounds access.
> 
> Hence, fix by correctly decrementing tid before cleanup to match only
> the successfully allocated TIDs.
> 
> Also, remove tid-- from failure case of ath12k_dp_rx_peer_frag_setup(),
> as decrementing the tid before cleanup in loop will take care of this.
> 
> Compile tested only.
> 
> Signed-off-by: Sarika Sharma <quic_sarishar@quicinc.com>

Reviewed-by: Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>

