Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61F38C43458
	for <ath12k@archiver.kernel.org>; Tue, 30 Jun 2026 21:26:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KREdOKwOAyIofQzjb8Ff0K7Ijz9cfNWpd0Wm1nV17Gs=; b=VVedhkqv0NxaihIJspD9x95BkA
	hKBWDJmRGhVnJk3fW74NCCI3eQmwiyuXOMlt0pWPoRvXOdmQ0GyTOUe8sOZibnPu+M0XOpPyCd9sO
	mE+gpiqEEoDTejIx7KsVHIkdgmHwphQSHB3GxyHPFLTQI4RZN98YpyQNnov4kVvEgsNvxEvnm/VnU
	t8iPBkOHOHsTVkPRp5oe7ZStxc5jGbUK7GUfCt4qI2pwdXhj7G5MEZtHSc0cVY/eVQHg90ALgTRqQ
	gEXuIsCUFqDQEzfifPA4v4q3j5eXFS6awMScCR09ClmjpC0oEuqKfp+5C8yiyDN9HgZl+WIAsoTir
	3xPvBFQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wefyT-00000000EmA-0Yyr;
	Tue, 30 Jun 2026 21:26:33 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wefyK-00000000Eji-2Pkk
	for ath12k@lists.infradead.org;
	Tue, 30 Jun 2026 21:26:25 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65UJDnxa2947205
	for <ath12k@lists.infradead.org>; Tue, 30 Jun 2026 21:26:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	KREdOKwOAyIofQzjb8Ff0K7Ijz9cfNWpd0Wm1nV17Gs=; b=mOovXEcb5gTVWthk
	QmrvjRHCpSWSi68OtPMZZDf5dV3Gm/xdseP+neFE/YdFly0HRRgcJ5YQ55a+xoyH
	h4SgaCqGoHrO8PnMv2Rc79Olf84opAh/aaCLIlBUiiSja8xw4+HDwKz5I06TblaO
	RNhImrGJNocSVedqSRmSfuXCas9DTRBkaztRa9Y8SPL7cq+S80dYVV/6IhEYASve
	zV2qWZFf1MaqYq36kuVyvbEvyNHJ5j0QFZHBSfxcCJc1FBhzNQLX0MfRB02J7hUt
	YWdIQMUntGqpnw8Jx1DrSUHMSCnLSi8b+2oyjqf18qJJVyDQ4/DkRSHnrUBn/IRg
	GT+Plw==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f4avpu93f-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Tue, 30 Jun 2026 21:26:23 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-30c0d568830so859588eec.1
        for <ath12k@lists.infradead.org>; Tue, 30 Jun 2026 14:26:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782854783; x=1783459583; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KREdOKwOAyIofQzjb8Ff0K7Ijz9cfNWpd0Wm1nV17Gs=;
        b=in3VcRCKTT+29T+dVhmHGu3LSvH1lrbDoENdCORiZoDSblZXlEoXKe0W6jkk+o3tm9
         tUxa/PHYdCx+I4cx1n93p0x4aq9lWgI8ZKqDCKZ8cyo4CN2ThBwg3MzfomzSQCYm1got
         H0okSMPmwMbK5aweYo5raMnpmOewGPHa0hUrbVpISTR9TKKuaPx5mhMhYC9ce6DGP4nG
         CAt/Pi8Nh8XqZZcnYfDbmFoRYhbXTkuFJFp9hScUUmF38THRgtM72rS+KpnlQjl0oIxE
         5X2DSO0c+6ULEaYUYgXsBAyyfGzRaNuZvGUji2fnteXaZe6rE3TMPSfqQ731+wpEW2Sl
         AdXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782854783; x=1783459583;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=KREdOKwOAyIofQzjb8Ff0K7Ijz9cfNWpd0Wm1nV17Gs=;
        b=AuZLlJEXChh+o9DDVcBluWe6KWJtA0yLa8SXoAzORDuBT2FZaYd9333ZF6F+hraio1
         o3yhstW4USBoJA+tPSiX1GaNpvNpJuV+Y4ArWuUtpPUL3Hb0TpdMJH+iiORbK2a/ViH+
         Qt1kqEmRLsAyvcwpIoYEsetP8lsSq9+mswFJbnfXBIa4RXKYHENi2Om+AKogRD4MlkDd
         Ai2cXPD29+6uqPR2mJDYwUrhSl9TRQUnO8YUUulWxTQ7CrSPJWC4rJyLnnRLwXmf6fkn
         7PhNhHYxqIPUbBytMbmK+9OapMYsZUp8wMfaCiwugjmxm/phcHmS6iklA0KAFldg4HuN
         MbNQ==
X-Forwarded-Encrypted: i=1; AHgh+RoGKmBqBlw364jxkX2sjdTcxFm1+iOJm6abRAgng3NjANDBdi4EWpymT4PD/UPnwstHHvUE2sc=@lists.infradead.org
X-Gm-Message-State: AOJu0Ywd425kkeMuuAOWNv2VHacNPB+kqX9ZBg82DU7me+JXmqNTcavh
	mA5H9raEih5vDa2oT/zqhLWE2pkruDmTnOsOALQc+Rjwokudscw68ZVnRTkOkTGGLMbzt9lY0fD
	yt0AVo/oDbPTIX56Hlu34X267p9yXLU7neu9ij4+Hfb5jBCjnFz9qGt9EiwZDSdwS
X-Gm-Gg: AfdE7cmSxuhD3KiK8ERgwNMDt3SuX1hz3oeHePOEkk7jPkC56C4WKBm4djBvxSD+Q47
	UA6SCpmPWh0HbBWYtuR37Or5Cb6aQzzd98Rn/zSvZSOnG8L1v4WCD3EgR3jKCWXB10d5HoAcmLZ
	P9MKJleh85FQnSqZjtwAZQlBwtPYpo5EbwMx+j9i36wFxtopQBB1JZovYBz2PpEyjEg4MxP2bsh
	9Zkvp5DWlQg8tK6H2KC17oR5mvzp2tPAkEbc/i8KX3C7AMTpoyMuNEbH39xnLqwBnVhpKilXpHr
	dum3KKq1+ohl+mKhYmsgPN/vaH5pkTeNCbbIvZ2+7Lhfz4YPFAnEIXd1O0wfhoOtJfJSpt4Vh+H
	2SPhz4AQfQX14w7Qkmk5DyStM1oOv70l4uegbi3C/gyCBCOz+LfI9gZbcAr3+SUQQZw==
X-Received: by 2002:a05:7300:5bab:b0:30c:ab4d:da3b with SMTP id 5a478bee46e88-30ee1472648mr3803060eec.45.1782854782607;
        Tue, 30 Jun 2026 14:26:22 -0700 (PDT)
X-Received: by 2002:a05:7300:5bab:b0:30c:ab4d:da3b with SMTP id 5a478bee46e88-30ee1472648mr3803032eec.45.1782854782134;
        Tue, 30 Jun 2026 14:26:22 -0700 (PDT)
Received: from hu-jjohnson-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30ee300b286sm11604046eec.12.2026.06.30.14.26.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jun 2026 14:26:19 -0700 (PDT)
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
To: Jeff Johnson <jjohnson@kernel.org>,
        Raj Kumar Bhagat <raj.bhagat@oss.qualcomm.com>
Cc: linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        linux-kernel@vger.kernel.org
In-Reply-To: <20260623-qmi-debug-log-v1-1-79471aa8b898@oss.qualcomm.com>
References: <20260623-qmi-debug-log-v1-1-79471aa8b898@oss.qualcomm.com>
Subject: Re: [PATCH ath-next] wifi: ath12k: use %u for unsigned variables
 in QMI debug logs
Message-Id: <178285477895.1590147.6905883761168987404.b4-ty@oss.qualcomm.com>
Date: Tue, 30 Jun 2026 14:26:18 -0700
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3
X-Proofpoint-GUID: MYYkRknzZtEBtNMr9eHiAH6aDdG7pQHf
X-Authority-Analysis: v=2.4 cv=KqJ9H2WN c=1 sm=1 tr=0 ts=6a44347f cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=tGGASSKubhSInVnLuO8A:9 a=QEXdDO2ut3YA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjMwMDIwOCBTYWx0ZWRfX5F+QZ4N8d+4Z
 MaruOI2J2STTSjhuScsA5Bzf/I5i8qXfTCCDPSK+3UiJnXFV4W2uYEK8NFWdwNwCQGcPauvsrCy
 8An9ZR1PGpfRU9D+w5Zj+2DWaJPaE4FEkU5QFkNUpyOlJ8bbIYEyKz0qejkwcqj6xjYpj/5EbzD
 817lrakMg2NrfUbmqozw1i8ZP72qnkkjy4ZWrz2UZ5RZs+V75YGYWH9R6F8jGo3gqscyBP2+r1e
 i9Zlj1HZ1CdkKEjDaJMLdV4Wxhjpd8rStXnA2NMBTV1iRs3yx5ya/W1IhTRFshH9pIJ9uQq+TSJ
 S3iHognBXVhcQPw5+vgvyXJE/e5eEraT/dTQ8P/zd3wdxO/N/TtqyWhmjmNERQ8upB7IAPxoZEU
 0nXrCi5vCFgCCPckWzDdXTlQX8TragGpBIwETt4SztYfC6H2b9lHztBSYbRnMtO9H4EADXjSTbV
 QWdMVfUGmupVTfP0zCQ==
X-Proofpoint-ORIG-GUID: MYYkRknzZtEBtNMr9eHiAH6aDdG7pQHf
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjMwMDIwOCBTYWx0ZWRfX9WFnS7d/TPBc
 IoGRcEWyx5O4aquh8JKXYVwpoJaIs2MfEfV+TEfZgXpaFEYrMY1c/5DmWBnqL/jBGu1F+psZhNJ
 ATpi8cjoThYQN3SM30nYUu6GIdq9A3c=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-30_05,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 clxscore=1015 suspectscore=0 spamscore=0
 phishscore=0 bulkscore=0 impostorscore=0 priorityscore=1501 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606300208
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260630_142624_757225_5B8A9CA5 
X-CRM114-Status: UNSURE (   7.68  )
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


On Tue, 23 Jun 2026 09:34:17 +0530, Raj Kumar Bhagat wrote:
> Replace incorrect %d format specifiers with %u for unsigned variables
> in qmi.c debug messages. Also add missing trailing '\n' in log messages
> to ensure proper termination. No functional change intended.
> 
> Tested-on: Compile tested only.
> 
> 
> [...]

Applied, thanks!

[1/1] wifi: ath12k: use %u for unsigned variables in QMI debug logs
      commit: 26d529b99861707ed0a4c626184b9399bedca808

Best regards,
-- 
Jeff Johnson <jeff.johnson@oss.qualcomm.com>


