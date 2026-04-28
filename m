Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3BEF8FF8864
	for <ath12k@archiver.kernel.org>; Tue, 28 Apr 2026 02:51:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rlNsQKrg2zvTTqEVgbQedG6D268H0WcV1COU8jMMdUU=; b=U8vFMDW9/kVNHwlyyCILalpWi0
	ZASMcxWAPLtkL/hPyCSz43lVWQh1D6lmO5oXkSk5i64kItpEHtXJh3/OY4Kv+pIFnE3N/aHUxxJ2/
	DMsS+1qjnN4EJdH464HfMvWel20rRqpoYKnwHPNzj5lwPBrYx/EqDqtJ6eNBb/ct9XP6HRifb1Tnd
	z90eP4wnWAhtnifjkvHPJje6ctriOV3u80sexpTbzv25sJm/PbOemX1Rri+9TWqyl5e7s3w86QllD
	rF/9YjL96WvTNeIzvq6WPJuXmxY8H1dairJIvdJPmz66GhoZeIeTsIg+E8itb1dJude01ud/JDWyh
	99+VwXog==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHYXy-00000000T1d-45rW;
	Tue, 28 Apr 2026 02:51:38 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHYXw-00000000T1J-0heE
	for ath12k@lists.infradead.org;
	Tue, 28 Apr 2026 02:51:37 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63RLnG2Z241408
	for <ath12k@lists.infradead.org>; Tue, 28 Apr 2026 02:51:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	rlNsQKrg2zvTTqEVgbQedG6D268H0WcV1COU8jMMdUU=; b=nYg+Cr8gxEJmNN98
	kgw87+HjzX9doTHt4aYHau2S403Q1dhCa/DNCfO2JZT8b3q/lGmftEPMw31niW9O
	sYin55YqsjmMEi9M0zZ/mTSk8hy2FlevZCT4eGl/JKSE6LfFf+gXPUlbeh9/8RKk
	S631/dWtKN0BmAuBzrT3tB9kdF0XB73OiunQu/hLlDVGdhMUgGCPqOg08ltG3B3a
	vaA7OHRDOuilnuz0WP9TuKU44VO/KJTR0lRMZuMB+gjuR0LMwZYcI13Q8NNVMh9M
	yCBkhQVNicgX4cAQxntQfWOpnn9PwBSe5Af41TrlT8dDzHoWaRgW0T9pfX0HMov7
	6a1kSQ==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dt946tkq7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Tue, 28 Apr 2026 02:51:34 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-c7985752be1so4265534a12.0
        for <ath12k@lists.infradead.org>; Mon, 27 Apr 2026 19:51:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777344694; x=1777949494; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=rlNsQKrg2zvTTqEVgbQedG6D268H0WcV1COU8jMMdUU=;
        b=TRUkbxV3ao9NVSizcng4HuEUlecQVOqIpm7fYMddDYYvCPEGI8FIujYgwcjW9qM2df
         QqTMcJt2XreDqFCpTLuYAyQDlgyHkH8rmOaVBr31AwnhZGj26Ap4d9BbGclvMmJcTCpI
         SeOAyFHau9xwFWkOXJITjPrLL84HjCLr3UQzo0jNCAlC8wEA+mCF3U2tkBl3amOtsg/K
         shN5SPxjidiGKC7yTvZgtZmZkXC8lOy1A2kFWWzJvbkmRIB269VwcSCR7/BOx/KrmN5d
         sdNxhKH3xUo66R5wM9RTPRGNHYHyabHEDbW3doAJtAB5OU00ccd7YDxRAYY4LkX6staS
         FtWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777344694; x=1777949494;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rlNsQKrg2zvTTqEVgbQedG6D268H0WcV1COU8jMMdUU=;
        b=gvNLUz/tK1WxEYEuTOm3XG+ChhP6zJbz9iRT93mPcjl4BR2q6ktFsKHVIKZ4r/VQuf
         00ChptAg4DO0rfeR2/oJNYEXiNfQh6PVGKD5hfvFHvyAqErfqUGHzx6AgiHIF+q4ptHl
         S7ZE0BtruzDYyACmvvG89+YVhFXnQq2krzWWB/pJsdLcLpHHSNFQYnMdzZ+Yr7SkeXt1
         qcdCOPtpJtFXNi9lxjOETD7pGb9ww6TmUEGNBOrothu33kMRLXAk/1DH1NwaxO5OfkOY
         0pPzy7WHdnhvgvCQrwn0Xidf0lX0HySHwGp67kgkNVmdR0Xuaxn6rtmdDRqqjwz0+xR5
         282Q==
X-Forwarded-Encrypted: i=1; AFNElJ+JRo+y6nZWuiFQBqs/eD9kx6X5We4IXWnMVjR0DOWGZq6lK0ETOaLJtIj261dXs5VVdob7eI4=@lists.infradead.org
X-Gm-Message-State: AOJu0YzcsdRx82BiEs7CFjNN3X4uJW/DoYZVOsUkrBidKOUYN3iD5Jyq
	MMe2FyKXfAcw0m/VzwaaODSkZH/jFX0ywOJ39wc9UnvscLkqByXtAmGof5bYnWiobgp89RfN+6B
	aj3jlHiYETyGmXuGmGco3LnUXjwy5f4Cc5Konycz36P755r73sopAZ7Fd4GB6ZA+I0m4Cd3aeXJ
	c=
X-Gm-Gg: AeBDiev76okIy/TrzWKrH6ryQr17GamZLbSdDbebGnJ6XFp4r2Xd4uFSUtwEuFcGY3k
	zqP78kiDeNpaAC9nv9IEtKkGGLs2G+nB0z5sKCE8BsF7bQ5qC/r3PT/h89ZsPVCcaBbaIDvJKDJ
	gPRs02n/hJ/Bgj7Wcm/tFBe+LeFvwCvX7jAKh4CYflQSsg2iNhuVsSJaHffJzOFkhn9w8xBrBFo
	vlyaxZf/zByYCve2kYFzlV6BD4IJ8n4zn4Em8r/ZIXCJmvNdQPJHZZfwZiCTtYFMSJzTGjW6zTJ
	SiRXuxsn1RAnYxf15r35UacpGLgq6fDjOWjC4YrOuBi/ISqUfGfLYQ2DVpucXo2XEtjD4GAHif6
	b2XRwIZpDTWamAYpneluHnqGMY5bgcYyiYfCQHuAzRgaGgGf34oHr4vGMSf104zWpcFtXZfPHJ2
	PsHTsfeum7MRtDG8bBSLuJ6eob6MLo7w==
X-Received: by 2002:a05:6a20:a121:b0:398:a934:9be6 with SMTP id adf61e73a8af0-3a39c28330amr1565059637.43.1777344693817;
        Mon, 27 Apr 2026 19:51:33 -0700 (PDT)
X-Received: by 2002:a05:6a20:a121:b0:398:a934:9be6 with SMTP id adf61e73a8af0-3a39c28330amr1565030637.43.1777344693387;
        Mon, 27 Apr 2026 19:51:33 -0700 (PDT)
Received: from [10.133.33.153] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-834daf69240sm857096b3a.48.2026.04.27.19.51.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Apr 2026 19:51:33 -0700 (PDT)
Message-ID: <18a453c1-87b2-4cd6-9e52-e7a1a0611ebe@oss.qualcomm.com>
Date: Tue, 28 Apr 2026 10:51:30 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH ath] wifi: ath12k: fix leak in some ath12k_wmi_xxx()
 functions
To: Nicolas Escande <nico.escande@gmail.com>, ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org
References: <20260422163258.3013872-1-nico.escande@gmail.com>
From: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260422163258.3013872-1-nico.escande@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=YcWNIQRf c=1 sm=1 tr=0 ts=69f020b6 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=tJU9ox1lp4qBWCJDgPMA:9 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-GUID: Q2FkH6gScA2RTsGhRRbsjpiOLzfbP68X
X-Proofpoint-ORIG-GUID: Q2FkH6gScA2RTsGhRRbsjpiOLzfbP68X
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI4MDAyNSBTYWx0ZWRfXzEm43kWqnplh
 /31+pRNUTdo5m1WgfJznkznVAxfGK7cmxeA0DNUDkd5D0bk36sn02+MxO6gaSSK0Ob62tC/HN7d
 Ux8SXpBsxcs4QJt9ved0oaKOfhc1wtfOc3JnxihOVGLKH/4leCRZjuu01FVB2nR/dH/9yflluwt
 brmQ41f1RkKBD5yaqLtvbernSucHV4xFI1l5Bg2eX9ACQYNO6ooNTt21B2Wt/EeWP4J1xgo3+Ka
 cIjg1E2meUjiE/QOVae6ZMXcJM2DGUsdAnKJ752Azv37BHbMpfLjw07dcKIN6HUQEajS765ldt9
 PdrFKpN5v8kixyir2/rn6LSvnKFe8Erusu7FnDmGFUSGnCWvTCSmZkvUdxF+Fy40shhLlVV16u9
 SNSvfCNl8dLMZeNhGcPqbfHaQPfBTo4poQRog8YxHlz1Ko6OeIEGtAyKmfKqjoB07TNC+i88i2+
 tDzZn0DEQdROBcLoI2Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-27_04,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 clxscore=1015 spamscore=0 malwarescore=0
 adultscore=0 impostorscore=0 phishscore=0 lowpriorityscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2604280025
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260427_195136_332445_1C1A9265 
X-CRM114-Status: UNSURE (   8.09  )
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



On 4/23/2026 12:32 AM, Nicolas Escande wrote:
> Some wmi functions were using plain 'return ath12k_wmi_cmd_send(...)'
> without explicitly handling the error code. This leads to leaking the skb
> in case of error.
> 
> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.3.1-00218-QCAHKSWPL_SILICONZ-1
> 
> Fixes: 66a9448b1b89 ("wifi: ath12k: implement hardware data filter")
> Fixes: 593174170919 ("wifi: ath12k: implement WoW enable and wakeup commands")
> Fixes: 4a3c212eee0e ("wifi: ath12k: add basic WoW functionalities")
> Fixes: 16f474d6d49d ("wifi: ath12k: add WoW net-detect functionality")
> Fixes: 1666108c74c4 ("wifi: ath12k: support ARP and NS offload")
> Fixes: aab4ae566fa1 ("wifi: ath12k: support GTK rekey offload")
> Fixes: 7af01e569529 ("wifi: ath12k: handle keepalive during WoWLAN suspend and resume")
> Signed-off-by: Nicolas Escande <nico.escande@gmail.com>

Reviewed-by: Baochen Qiang <baochen.qiang@oss.qualcomm.com>

