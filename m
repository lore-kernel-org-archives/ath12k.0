Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32B5DC4450C
	for <ath12k@archiver.kernel.org>; Tue, 14 Jul 2026 18:07:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lKUoUOG83HnISxbGitZOWdqzLkiT3rZOC6DygM4z298=; b=go9DxR+HHJMRCm07g+WNcpr7rO
	shITmxVHqqJ4b3XHAYh1qgYvnj6tbXMAZJq8XtpTLcLcS0+ckH77dyRZp34hqDjhfIWvSwut7dCQ8
	9AaySqbGyE6u1ejsm7e5D2FG+qp0oxeou1p96kWQrW/pL6d0QBYGlfUB+QRIk4qQ8K7Cec+RD0arC
	7KhHif/7ulbHItg4lK1Dt6EObVU9c9nX9ESDclCs+HpGfqv3hyc7nP1zOrBM1041huW8bnkIwIEAU
	D2GBkgI+5rLBPuxQ3A1W2EYzLvFii9mOQ87oacP/TLZLdNr3XRCYKUir9B2Qusa0w4Xif76OGSxW7
	5M4Gcn3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjhXy-0000000Cq6m-3meW;
	Tue, 14 Jul 2026 18:07:58 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjhXv-0000000Cq5n-1hIX
	for ath12k@lists.infradead.org;
	Tue, 14 Jul 2026 18:07:57 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66EG6rMo1097205
	for <ath12k@lists.infradead.org>; Tue, 14 Jul 2026 18:07:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	lKUoUOG83HnISxbGitZOWdqzLkiT3rZOC6DygM4z298=; b=HHSDr/U4ZCfNa2/R
	r3ExHKf9uJUQ1TmHAwTzHojrAUQWrAS/Iab1OOLeZkO4krHBdS3wGdkVzi3bO63C
	uiQtb7Y1+I3vMa7j38Si41k+tJ/UgKCFVXUnoOwzuWFFrbFwR+q9w6un0jrmN7vy
	wXkVEdWoLybUs8B1pwIJ5bmiXRJgbQtvOTXY5u9gcOER5Et9RYecc7AUK9lRCDE6
	4kwdR3kvXl93+RdjUuxoMGiArOGGzmBZh6WizVmmhTa79/Wn/Hvm/1Anqbk0LqHR
	ndtbGO57eoYTxuaevJaRpOoYoyTYq50YyTpc2lj0lpEjcZv6zgMhAAeM8NsYXyDX
	tipkBQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fdnnqs9ju-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Tue, 14 Jul 2026 18:07:54 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-92e5e38fbc5so618335285a.2
        for <ath12k@lists.infradead.org>; Tue, 14 Jul 2026 11:07:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784052474; x=1784657274; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lKUoUOG83HnISxbGitZOWdqzLkiT3rZOC6DygM4z298=;
        b=DZRIsdkbANtiKs004FZYYhCPtK7xLQPw8DwOzlE3ksyelpn6jWN2L4JxVSsx+IBsyL
         HBchpDZVKMqCiLHt1vqzjLcpYX7J4s1E4ZhNsKICgJBzTaXXDfE1p7KSayAiKTZwQRh4
         Wx+tmaUeX42e0QpZxyLUk0Pw3s3/hvP7g94SxXm5jXVZDb+GkSyqLyYZuhqGACMtMtlW
         leVpBB1tpauXhwHJGmwJZTQ1Nabzkv7Gm4spZmL9dYIHzmOfUyuutmDfxIC0MO+IuQB3
         bfQhvaHQ5VnmFtQ8dGJ/6ur81YBre1X/cmWq6LQBI1NPn/czDx88WQYnUt7GgM2zA7Rm
         K5XA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784052474; x=1784657274;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lKUoUOG83HnISxbGitZOWdqzLkiT3rZOC6DygM4z298=;
        b=S3nB3jf7pSvkMNL2cG0wwm96ua3TKZ1abAWSxY+BywmRxybfh53ES1HuQwTfJNCGP3
         oTEKzaLD9H5e4NZpWvmE6mWEkMMJPOBtmDlaiCRm0e8lKhfReLh6ha6JX2sCZqzeRUOi
         xLHJk+lgnso9dsV4k1tt0lTOs+puxirL0xf7s8vuaiOJGbKtMO5D9zZ3BYMKaYmpTKli
         Wuk0taQhHXaDVKHQfrHQL3I9nqHijPq7b1cOaWXQcO9Fw3uNwGCsxk5Nat4/yQNbkViR
         +I6VqOmHxR8bnSXUTcAb5nElPOugI+3GwPLWEY2gyLOSEA2DYfqeoB6TDqOf9eyJZf4B
         P9XQ==
X-Gm-Message-State: AOJu0YxlSTOoY3cg6GYQpniw3dG7PshkCS0auB36Qlb/sz2Zl3tx+q2J
	7tR17WQgNdqUFRsl+TxeSYxUHqDRMYOB4H9Ar+UkNf4QVBCCfYVTiF5hKzQ2jYWpnaILwd0l7ec
	UQZpJdvj5RD/Nd9Il/dYidPOYkCJw4AttD3K4LVnbNvlCfQShY2lHlrOScru7pD7+Hr9xHlNX
X-Gm-Gg: AfdE7cmN6Rguxx8HeQ3JVoLPryBEHlJQqJnmi8kkuUNlvqqxmpQcFNzdnkagOFiSmxs
	CwaPNJaZvU6WYkwZ/FkYPQx4+YMrXIH58OliBvF1d7IY6ymbexQkafH1xEg0fNZ8IN+CLIKR9nB
	gTRQ7b7+rO25bNL/IK4+QzZ7SIEVWyizMmNQxfRmcMxybC7esJi/2l7TmdUIU0B+OgYkbR9e1EF
	JY8YrQ1hg+G+BiYf1NjxOMkPRZnl5iv1/745bOe1c6cE7Zok9IEg7sKNzy0NyXIUHyXGBfXP5PW
	BHWKEu+BZpd70lPqo1lRioZjnhbHFtpxctLV9/7sjcGdyTHCkiooyRuyOti+sjSUFNnrlIJdKx9
	xbHW6E4xhuVkaBKMOaUImg/5FJD3mme9Qhv9xRTQOf1R97PwKf1HjeArgR70O0WT71Q==
X-Received: by 2002:a05:620a:2a04:b0:92e:dbbc:3992 with SMTP id af79cd13be357-93086bea7acmr309130485a.52.1784052473935;
        Tue, 14 Jul 2026 11:07:53 -0700 (PDT)
X-Received: by 2002:a05:620a:2a04:b0:92e:dbbc:3992 with SMTP id af79cd13be357-93086bea7acmr309127085a.52.1784052473445;
        Tue, 14 Jul 2026 11:07:53 -0700 (PDT)
Received: from hu-jjohnson-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-930759c63fbsm465448885a.22.2026.07.14.11.07.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jul 2026 11:07:50 -0700 (PDT)
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
To: ath12k@lists.infradead.org,
        Thiraviyam Mariyappan <thiraviyam.mariyappan@oss.qualcomm.com>
Cc: linux-wireless@vger.kernel.org
In-Reply-To: <20260622062324.758533-1-thiraviyam.mariyappan@oss.qualcomm.com>
References: <20260622062324.758533-1-thiraviyam.mariyappan@oss.qualcomm.com>
Subject: Re: [PATCH ath-next] wifi: ath12k: Reduce RX SRNG interrupt timer
 threshold to 200us
Message-Id: <178405247016.4102418.4581007365191961426.b4-ty@oss.qualcomm.com>
Date: Tue, 14 Jul 2026 11:07:50 -0700
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE0MDE4NyBTYWx0ZWRfXziy9uKDy38Lk
 FcrCv/OsPBZuzYwFREGMe0CEt8jc6j3YWbpD1WoXpy0eNt2uw2dwOToLToV1w/VvKN8ISt7XCE8
 g4/n1i9tiZbCWbhAXy27/daDMyn7TX/Oe6C4RzuC3dSamuV0qJga0ro2mhLKT/vG6goj/vaJFGx
 4V3Tn4ko8AsUKsXffzfaINwRRpSEexi8ySkU3NYZ8+H7u5aJaQaWDC85zK9g25KFmHMnQVPBDQv
 2StpNDN5kPzpnb3z73+cnJgevx93Cc+Pr0VjVLuLL3yVU7NSOd/tl+qG9sJPI6vWFzohrrwHFBR
 VZJKRn0WIJkYVmaldF09pUyYWs56+vSEKtNHf2dPvWxoZNb0RvsV8SfbJbryeaN8JCzns3u/jda
 sBaiF5+koZYND54HKmkplvgVMXoudggUUkSPiNMf2qqqgBaHDUTtGoTJGQAh3uQJU/h1akggsNi
 1gYE4XiN3/X4hZptQFg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE0MDE4NyBTYWx0ZWRfX6EUVktT6WLht
 KsRfw4KMCjq+4GbvqKojXj8IS6vyqRFxENgeZN1oEft6+cpWOWoVBBSIHGv5NFBuwhsunMK/kuw
 i5o3v2az8sGQcOE+K4auOET83ZyL/HQ=
X-Authority-Analysis: v=2.4 cv=U+Oiy+ru c=1 sm=1 tr=0 ts=6a567afa cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=yhwW3CUv4AqFQEUyz7wA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: cRGpkxREUkyHe041FXsUlqKKxYlE0_rS
X-Proofpoint-ORIG-GUID: cRGpkxREUkyHe041FXsUlqKKxYlE0_rS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-14_04,2026-07-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 malwarescore=0 bulkscore=0 lowpriorityscore=0 suspectscore=0
 clxscore=1015 priorityscore=1501 impostorscore=0 adultscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607140187
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260714_110756_375083_247D8F0F 
X-CRM114-Status: UNSURE (   8.44  )
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


On Mon, 22 Jun 2026 11:53:24 +0530, Thiraviyam Mariyappan wrote:
> Currently when RX traffic is low or intermittent, the RX SRNG interrupt
> mitigation logic defers packet processing for up to 500us via
> HAL_SRNG_INT_TIMER_THRESHOLD_RX.
> 
> This causes excessive RX servicing delay, leading to increased end-to-end
> latency and degraded TCP performance in low-concurrency scenarios.
> 
> [...]

Applied, thanks!

[1/1] wifi: ath12k: Reduce RX SRNG interrupt timer threshold to 200us
      commit: 6b31c3451b12cfc5e86a41898014cb62d2a377b1

Best regards,
-- 
Jeff Johnson <jeff.johnson@oss.qualcomm.com>


