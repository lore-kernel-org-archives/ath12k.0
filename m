Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 259F6CDB479
	for <ath12k@archiver.kernel.org>; Wed, 24 Jun 2026 08:33:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=r6YjZTAkz39e4oM5Dzx6I/b4gSdwG3hszZGxP8QBONc=; b=xY5Kg9z6qQicfGqMp4iaSgSlaQ
	OG2P1rwACgVdVZJaSi0v+65b6JqBD4kOMNx4vh6UYI/CppX38RkWwEJhkbiBqEvxXphx7jYd+ZMUQ
	SJyrYtYysArdB82dOU91PxRloV4Pi/Q7AO7UnOSVQ9mjVbbQZSPEHCVTM7lkhvJiE9H8u+aByoZTF
	nnVqBWc01BOCE24TYZhuHx3ap1kWcniXtmJRqiE116pkNcIAlpzV6FEMHvgWnHCAZRz4lKRiRbUI3
	gSwtE1afJ6Ho6CurwDxeh5UdzXagHRQcZgHs7Hjmnj33FAFoNYaX6fJKqsnQ8A5J8lpobHKuB5R2F
	VXlLD09A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wcJ35-00000007OvF-3jle;
	Wed, 24 Jun 2026 08:33:31 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wcJ33-00000007Ouf-182D
	for ath12k@lists.infradead.org;
	Wed, 24 Jun 2026 08:33:30 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65O5uHQN2460743
	for <ath12k@lists.infradead.org>; Wed, 24 Jun 2026 08:33:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	r6YjZTAkz39e4oM5Dzx6I/b4gSdwG3hszZGxP8QBONc=; b=OHrfbIAjZis+NOpc
	cIJGBoUUmUTti+/3dMthJMg4N57NXnFOxvBTHRruHsgJlJH+oEpV68yJ7V2QjV1/
	tsdmStuRxW6XCVw0g4KoYlUXpVXVgtIVtTmIxHWc8mudU+8jrx4nwQG0yNWeDgU/
	LNSdf+erMORjMjf/UHyyWbyQmYb9W43XtJIw5fuyi3G5UoSK7mSLoWQlGKMD7MoZ
	QCbK6PcVCKaFWiyhU1xqo8Q2VK18lOFg7YKe1IlzAIk7G16rGJOcc/n1yQ3bRH/T
	btNPpPpR1o890uPr23G1n2zmEbjGgieyvKn/pFVaNXMqgR4lHth/0sDMIW1g9ns3
	wqIWgw==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eytvh3x7x-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Wed, 24 Jun 2026 08:33:26 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2c7edb8505dso1023925ad.1
        for <ath12k@lists.infradead.org>; Wed, 24 Jun 2026 01:33:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782290006; x=1782894806; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=r6YjZTAkz39e4oM5Dzx6I/b4gSdwG3hszZGxP8QBONc=;
        b=cqmGht6x+MVs53og8xJJRN/RnzvGw55qtHTlaOwizu1bNS03r+T4/de5V37i/9NigJ
         4GKDY1KIlUXaE0/ZcVq3ORR2rRJBQapNXTgQn8MaaPraY78MgdSrkRyDsEq5hQ5IVZrn
         Ptvl3Npv27R+9J+NEwJCwEoSjhJxTpkJRfWXLPEaeB1vIzZ3Xf3l8nhIj+aLOGhYZyGJ
         wUOA6BTOv25fYqQjg4gQ/G4+eXs/cUzpJ0dz3eyUIlpYIkd+HiK4HaPs48I2jvfhwotq
         Dtm7g7YoGbc0YEZnlGA+Su7xapU1e0Bh3Pcv5tGl55sXQTTTlirvhBClJ2uq1tlV5QgJ
         xkKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782290006; x=1782894806;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=r6YjZTAkz39e4oM5Dzx6I/b4gSdwG3hszZGxP8QBONc=;
        b=NjL1sf3WhKKjOXfjBsnx7+OqOdqk11g4zZ4ryzKNtcXkCtBoiBDv1Kxoz6i4wSiQSv
         DZ8w6Zyfaw3vX1ca+qkIOWGPD0Cj5/gcN/4OiBPVK8QznpxfAitjYwRlq21t5741Xgmz
         gTxkr6Mc7v4EPIlYo3qw2mLGQh8Mq97hF/VJAKSnYb0cWpoBMiye8DsUETdhvVaM7kz8
         e/76fd7ekSPtrJaB0Yfjh3eBWvQloCvITdkM7aOccb5bR1BraH2MNHAU9f+7Cmo4Ozhu
         M2ugN9s3Q/sGG7gbCdEZtqlNLe0sLmI0Uk3ZEJX0sqmptZRDNUIw0ERNAWd6APHyBTLL
         b3yA==
X-Forwarded-Encrypted: i=1; AHgh+Rqa1kzuaueear2DOxiyCbPyImXM/y5D9rHg9KcYm9vJ7pHyIzBfnX0gB6KXCpXmGYYe3VLmNCQ=@lists.infradead.org
X-Gm-Message-State: AOJu0YyH4GnuFtVnXObolTsm7KvmuQ1nlvg7l1wbeNXN4NyE3nt/rasF
	///ZVYvykI6Pkil69ioO1GKkcXGbGPD66xGR6sdC2J89o+sxKNVl88yJ1IPrQaA7O0cCQt90BdQ
	PbRSv3mR4wymvS4L7Xwh7iaXm90jJd0I3o/DGBTsYGCink+fCT87gFOgY1q1X2scd
X-Gm-Gg: AfdE7clgYpGrJnd8RlBl8nfRUp6yy2S15HA8EN/+PwXXS0ATcY8rFnWFX29xjNK+SSN
	CxSc4VbaBUZajNd9AjmQUPIiS6UxXq6qqDO2Ri6z1WbXkfQGvjgr5x5M7HU8qA1Bq2D4U+T1Y80
	k39nDr/nY+u25ipxideZNd132cjvpjXa6R+NB09ldLrXfnl07GIZXPbOghBsezhFxsgkrxl7nJC
	SvPT5i9jdvPnnwAKU63WZnJJDEq7xoZbRthyIdpY/HNRMdV48lWoC7KLN1Z2jg6jYIYbah69+R9
	46vvpF/xpwlNfbP7oleHdVsDFYsl066/mU/LLgUarfvYCb62Dr6CjnF934PIOP4bvRUYCzbkmGV
	/CkCfDnZwHBs++84dwXrUHG98xbSskfDXrs63S81jhF09se0e0vj/fxRCu/1UpwU=
X-Received: by 2002:a17:903:4b08:b0:2c7:ebfb:6176 with SMTP id d9443c01a7336-2c7ebfb6545mr5504795ad.16.1782290005705;
        Wed, 24 Jun 2026 01:33:25 -0700 (PDT)
X-Received: by 2002:a17:903:4b08:b0:2c7:ebfb:6176 with SMTP id d9443c01a7336-2c7ebfb6545mr5504305ad.16.1782290004930;
        Wed, 24 Jun 2026 01:33:24 -0700 (PDT)
Received: from [192.168.106.30] ([157.50.13.229])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c7c1ac80b1sm46483995ad.73.2026.06.24.01.33.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 24 Jun 2026 01:33:24 -0700 (PDT)
Message-ID: <18d19f3f-f6b3-4dec-bff9-ae3dbb8dff07@oss.qualcomm.com>
Date: Wed, 24 Jun 2026 14:03:19 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH ath-next] wifi: ath12k: use %u for unsigned variables in
 QMI debug logs
To: Raj Kumar Bhagat <raj.bhagat@oss.qualcomm.com>,
        Jeff Johnson <jjohnson@kernel.org>
Cc: linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        linux-kernel@vger.kernel.org
References: <20260623-qmi-debug-log-v1-1-79471aa8b898@oss.qualcomm.com>
From: Rameshkumar Sundaram <rameshkumar.sundaram@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260623-qmi-debug-log-v1-1-79471aa8b898@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI0MDA3MCBTYWx0ZWRfX/ecz2rykkTac
 zrzHZNtYH2dV7HcJZufzoSOIEqJGirf/v0gjQK3AyiDCtqzq7KnV3dvNMjMwNZTtSHo5qwBdnYH
 +8eYSA05lJ4oGkjH1nQI1Pu922jKQ+YdM0G3AAwn8SJak+1JsKJFqKF1O2pTJZSP5X0IRV9vv3g
 aL5uyWBf4NR7W0gFbaJVE9ybSuL66g3T0I5t7vNLonyRLPp7tCo7fREApT7mK0JyjCTFNrpLVuA
 Totdp9FB8bxkb285HSVgBK5jEWQpKLkiz73djaCl2AWP+H9N8Nya1KblE2u7Go5hnYlDg4mHbEN
 bhtYizPBI1RD2+OUeoJVuJVN2qAifjgMUWfZo0KVqalScdVsBz0ppPB4/AlXijXBD/upHTkkP5M
 Y34StQ7x12vt8IJWmq1th9ihTZhoPg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI0MDA3MCBTYWx0ZWRfX8ul3ULU0DgN3
 XcY01SzHrIWLU+cOkORufuOAbyfRL5HdcaObPDF8GaMEd5gkPkA2qwHehdYMeGe17PI1k1N3KFl
 rLQ2z9Zv8prXC3LsJnMq3JY5QAujad4=
X-Proofpoint-GUID: L7STKhZN9IztImqtkU2O8PtdrICxYbVd
X-Authority-Analysis: v=2.4 cv=AJDhMgPs c=1 sm=1 tr=0 ts=6a3b9656 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=DysFi5wBN3dAxe50r5uYmQ==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=tGGASSKubhSInVnLuO8A:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-ORIG-GUID: L7STKhZN9IztImqtkU2O8PtdrICxYbVd
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-24_02,2026-06-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 lowpriorityscore=0 malwarescore=0 phishscore=0 suspectscore=0
 bulkscore=0 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2606240070
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260624_013329_530996_2326FCA5 
X-CRM114-Status: UNSURE (   7.54  )
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

On 6/23/2026 9:34 AM, Raj Kumar Bhagat wrote:
> Replace incorrect %d format specifiers with %u for unsigned variables
> in qmi.c debug messages. Also add missing trailing '\n' in log messages
> to ensure proper termination. No functional change intended.
> 
> Tested-on: Compile tested only.
> 
> Signed-off-by: Raj Kumar Bhagat <raj.bhagat@oss.qualcomm.com>
Reviewed-by: Rameshkumar Sundaram <rameshkumar.sundaram@oss.qualcomm.com>

