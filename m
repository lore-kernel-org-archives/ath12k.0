Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 857EDCA6012
	for <ath12k@archiver.kernel.org>; Fri,  9 Oct 2026 01:49:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=reYM3P+nlWFzN0k3Z53zyDtS0t70RVoAF/laZ8YyJOU=; b=Apz7JI9ZRYCqccyZZ5aK+B49QO
	HA3J8yFTpu2PbfMdAvj0OUgkujjBL9OD/5ykUCO5OrMymsWQ3QmSDf0aO/vDvqHJn4Idz4nl473fJ
	dqJVyjATQ9vn3zEUtZ2cnC0uQsTKo+jCd2AfrE4FGAlGtjeUq0LwKduQasjVey+KKTSOV3wB04TXT
	gA32umMcwmTPepXLGd7C2BEqOg+gEG4vvrY2bjLQ0pdTxv6TUi6Ca06z9TwyA6jMNwivoDcdnn50m
	+hB/mL9lFyZkKDhdc0idYfobqFhmpBQ3cxyB8vVP9B7YzmVPyHXVNUqQPEM37IrV+hdoJgbfk2NZy
	ZdKaZW5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEzjz-00000005Fl7-2GWd;
	Fri, 09 Oct 2026 01:49:43 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEzjw-00000005FkY-3sr4
	for ath12k@lists.infradead.org;
	Fri, 09 Oct 2026 01:49:42 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6990PvDm1348600
	for <ath12k@lists.infradead.org>; Fri, 9 Oct 2026 01:49:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	reYM3P+nlWFzN0k3Z53zyDtS0t70RVoAF/laZ8YyJOU=; b=Ik0rWI50KOxBilrS
	XZf/mw5UmwiBYR71M0YEfB3+x7S3JoAJd4JhNDqKnREsbV9aDoXtE0bWnWOPSFqm
	7QmikVL/8XxAfiCr0tgwVNq4GUlqttKgEaG4totioBflBr0GqmE/VfG51i6qZ1Fg
	Z/VwNn8+06SoTXxZkbl5rYYQewv202TJgG16PHcbCrQCHhJVlE9eF56NACtVFtGh
	hfPcrVifJ7q7W8Gg5N3HH444/0GhTMdQwc9D1X5Csc3Dzuhw0m/4zHmEK0EeCJEt
	7RVUH1G7dMfcMbJM6YBmwPC1Qp/KQxw+Su9nAyMbMg7T8YsYpi/+A8Seah3kW/Ls
	UNK/iA==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h6fxw9cx7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Fri, 09 Oct 2026 01:49:40 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-3aaf955db5fso1833163a91.0
        for <ath12k@lists.infradead.org>; Thu, 08 Oct 2026 18:49:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791510579; x=1792115379; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=reYM3P+nlWFzN0k3Z53zyDtS0t70RVoAF/laZ8YyJOU=;
        b=Z51zmlsd3VBpFfqYuDjmxFefyP6F302DFQcW0ZvXhSj7JgGfoxafH3ZqV+oXAX8HiS
         e1tMZGfMPA0Gk6WdWqEWt3FJhq/y67LzuQeCS9n5Cyqbi3VxpzNfGMQ+GjW6cHVGFWYw
         jyvax5y8Nhdj7aIgHItDJEgJUYfaJU/MSEZbwDB0Edz5fFle3sz6JqN2c35qpnp0ka3m
         EkDUe2TB8pXFTxZZQ6irWsUjs7jqR6kMYxQ8vfKFr7Okp2FUkajb38qQCaDind7UO5xl
         TMdpatJNKn6O2gz8IgP7low4Qfx6AWmq8roUZ1Cazo8fkV63EdqEIu0Q5GWV2W4+ZVaW
         wNhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791510579; x=1792115379;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=reYM3P+nlWFzN0k3Z53zyDtS0t70RVoAF/laZ8YyJOU=;
        b=AX4XchGcwJpSQM3V896NF9g1vU0vI89T0Pdebh59uQz4V8RBqoVxGQJKLcfM7ykwMy
         xRtUUHSdBQ6g19TKiCzdNKRwuxIP30/dL2OyS7+s/tTnXWa86qQXboeKdIZwwRIu1Zaz
         O3vfA6/c78KgFzsmXstL2joOUIhL828KAIKWJUn3+C+0FnYT+kVkjjjusS2Mb+5RKfZC
         K5vurUTutMultAaK+OsFy8KBzzY1L5ByG4NIXCszcUMzxbZyiA9uydyWYWCCyJa29Y5j
         0N9HxyBtjG9jYT97ZiQE+Rw3b1GdGrcpX7u/UH5wGsxuJwNXwmNFuBnrtWgamcLfGxUU
         QbAg==
X-Forwarded-Encrypted: i=1; AKwUvBwUNrcf94Xc5DODOXj4+2pXdKMVrDGk8LtDe3WQVJtsc4dELLQn6vbt4Zj4YuzyJLlv0ak3xT4=@lists.infradead.org
X-Gm-Message-State: AFq9FYKRUlwqnOEzPHVS11/D5yF6o3vsvw5ILJFzG+fiMdEdSQRHjDCi
	gYCLN+FjO0BebwWlKJiTY6pTNlG9YPn1NCAJ/NMuDX3Qh2UoY6OA49xwCoxh6LVUd8LkNsGIWsr
	yVNswq7sxVwgtmwoGy5bs3a4RuO3vUge5JNQlLdAMGAyKuX6AuUl4y50CFrjL6/8AEVQX6aXGVc
	c=
X-Gm-Gg: AYBFou09ufnwEZlaoUGZm9zGMpD8zKBu1vIDKaCoeNMEDv3B0UJfz9/PFSe16c6ghDW
	UeyeXgpjpe+3F0gqe6vO0CWnwabdYJdTsnvLv1YTLJRBcpLDSgV2umpJ+cduHKw9WlQ76aqQAlZ
	0swFKGs4/6Ox/BRrscWPkkzkYd1I35+Y2Tillr+J68vaC/LOTmQy0w33qUvk1Gm31TutnC/wRF+
	/uIeBdwgiuqdYEemhlr2FQPcscdEGJjWrrwjHLGLo/H+ePcrU7wdD3utFqS4h+uDl8w9u2TXT36
	vctlvpozJ44ESxDm+3YYD0y71KvI2KzUJnvtAZCwBOxBcN0v2u8gMAqulrCflhHGEe3cQS1uU7X
	zLA8W06Ck4rQ74/oyp09PTTT5DT2NH6tntf1wAJMmQWXTuJM4Nl+4RepVcPKpIuuVK0CI0jk=
X-Received: by 2002:a17:90b:48c7:b0:3ab:8b2:72bf with SMTP id 98e67ed59e1d1-3ab3a928525mr595794a91.50.1791510579453;
        Thu, 08 Oct 2026 18:49:39 -0700 (PDT)
X-Received: by 2002:a17:90b:48c7:b0:3ab:8b2:72bf with SMTP id 98e67ed59e1d1-3ab3a928525mr595778a91.50.1791510578920;
        Thu, 08 Oct 2026 18:49:38 -0700 (PDT)
Received: from [10.133.33.26] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ab38e041d4sm1324187a91.9.2026.10.08.18.49.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 08 Oct 2026 18:49:38 -0700 (PDT)
Message-ID: <9a82f0ae-535b-4493-a5b7-07af047d094b@oss.qualcomm.com>
Date: Fri, 9 Oct 2026 09:49:35 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH ath-next] wifi: ath12k: Remove unused
 HAL_RX_REO_QUEUE_INFO macros
To: Jeff Johnson <jeff.johnson@oss.qualcomm.com>,
        Jeff Johnson <jjohnson@kernel.org>
Cc: linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        linux-kernel@vger.kernel.org
References: <20260413-hal_rx_reo_queue_info2_msdu_count-v1-1-c4c92ccf77b9@oss.qualcomm.com>
From: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260413-hal_rx_reo_queue_info2_msdu_count-v1-1-c4c92ccf77b9@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA5MDAwNyBTYWx0ZWRfX24ZaJZRrvsMh
 +8wRuv8zQid5ZdA+XqQIbQDEgsC6DFIg/EVd+FzwU5fxu2g3V1ou2o0wAD554doJITRqfrA26IZ
 8KR8t6ZqrtnF8xoS9Kq3mub4EclqMV01lnnyonOa4zV81S1dZlo0Nli3VI3rWLcD3XwPQOk9jgZ
 UE88QFXjQh1Syfm/gujHFkgjdc//KwqX32dwY0Q6cxI1ILKHg9iplqVMS5xYBOS5L6YUM2bYVuE
 VH0DHinl+aQWxy98mxJxJsT/pvP80BPkp/fUFyqReRBoBpkzArP53rVAepU+Miu/t7HlSR3G+kJ
 cn151EFOfaHCXxTr5knhwP46dj3YYP6hD3XwXUDEw/dd1gXUwiCYyY7IJ6AGzluNbtHkJDFnqPn
 R8QUfK9PJT8MC4loRd/Ib0smum2yNuk+Iii++d4zqlcct43eHwhK4Oj0SgVVhcsgsDYS6dUZu5q
 XR0RnN9lkTZH17vvHHQ==
X-Proofpoint-GUID: AlVr4-McyyOFls_36CjLATFqfSJQFwsj
X-Authority-Analysis: v=2.4 cv=cMB1IVeN c=1 sm=1 tr=0 ts=6ac84834 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=ih17vKD8RMQI-mVctmIA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA5MDAwNyBTYWx0ZWRfX7jPA06PBdLIB
 HCPtbemawNl36a4XMXCQWsora4azpPfnYQq8VLF/XaxD6kUCA1+k26TUhDOdvCcO1o/J9oBQbbS
 fpZPqWQ8fJ/NAmNzbUQjzDxoqklQu1k=
X-Proofpoint-ORIG-GUID: AlVr4-McyyOFls_36CjLATFqfSJQFwsj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-09_01,2026-10-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 spamscore=0 lowpriorityscore=0
 malwarescore=0 adultscore=0 bulkscore=0 impostorscore=0 phishscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610020000
 definitions=main-2610090007
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261008_184940_998706_080C95AC 
X-CRM114-Status: UNSURE (   7.35  )
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



On 4/14/2026 7:58 AM, Jeff Johnson wrote:
> Many of the HAL_RX_REO_QUEUE_INFO macros are unused, so remove them.
> 
> No functional change. Compile Tested only.
> 
> Signed-off-by: Jeff Johnson <jeff.johnson@oss.qualcomm.com>

Reviewed-by: Baochen Qiang <baochen.qiang@oss.qualcomm.com>


