Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE5EAF588E3
	for <ath12k@archiver.kernel.org>; Mon, 20 Apr 2026 15:27:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jVkE30hQ08LQ7R5FThqKLE6Uk75qf/KBDIHUXGckQOk=; b=EvC0wLIqWtZhpU5oWaHaZr5DcU
	4V95rMx1qOVPH1k19seSEmopTAxPAxl8swyz8njTAWjsyMMPVG8sm5T73cyeytVA3tcSCmer/G99S
	2h2qWRoxWX0vuZpnL+XYRXnmL3zU8Y03KrR8oHUDWoJXvnsZtqpLcp/DnHx92lEl0rxeGHgqFBP4e
	qmIwb6l9Ega13IEdT5KsuIU2uBEnz2xMDlveLaCQlompEgWn5waoB6qKRwjizhOJnH/P1w1HqDINr
	EBUfTU+LOHbpByQMTbi33LOaR278LbijTQ9v1K/Txsa8pns38jjYUuxqS5EKlVwfV8qeUPgwnGb7g
	h5S5dxGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wEqWf-00000007HRP-2V3w;
	Mon, 20 Apr 2026 15:27:05 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wEqWc-00000007HQz-3Tv0
	for ath12k@lists.infradead.org;
	Mon, 20 Apr 2026 15:27:04 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63KBGUf11598266
	for <ath12k@lists.infradead.org>; Mon, 20 Apr 2026 15:27:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	jVkE30hQ08LQ7R5FThqKLE6Uk75qf/KBDIHUXGckQOk=; b=VjDxrrDHpm8xRm/g
	aHz09UTuUfvgz6CzP0YR/A4f7uQeDJE3GIBjY9AUl6nfzxVQK8wSGvNSjIMP0XEK
	/qqKRBRLuORcS5LrneGnEgv95O9DWiyMbyI+xjujABS8yhGc0HQu2F5D+19qztLj
	j5I2teaRCFz963vrSlgGHKdKBobbUUzdq+oqmeyB0wmQjpDmpga/BtwbXpfdyBi0
	MuUE2ZhCYzaMzL34Ja6Ye6GNYQHU5ti93ZE65v6CRIgW/LEnAfOaBimpaV7zPQDh
	FpGGAaJ0k86VEz94CTLKH8QQIa0vy4tksr7WFb2G/LWnXEe8dmUxf9QZT4Uun+XQ
	aFWknQ==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dnfgnj3eg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Mon, 20 Apr 2026 15:27:01 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-2c16233ee11so4323821eec.1
        for <ath12k@lists.infradead.org>; Mon, 20 Apr 2026 08:27:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776698820; x=1777303620; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jVkE30hQ08LQ7R5FThqKLE6Uk75qf/KBDIHUXGckQOk=;
        b=f6qqCpvpfWrCeagfZ+LBvVFLmjbmaeGCN7zw8WsaCFNkgVFFET0GBX1u2XadydI1rU
         Qm/NwiYkFEjIzab7b3Db+w9bY78VT9sBCFl9rPmE8ovlOwFJjfLuylNoKFjtNfiQ7cNV
         sHvSqNSJKIXVoG6PIBvwpFwgrYxzitU+zyAS9L+h2XWhs2S2oGzmn/1bsqYPuXvK0J5n
         s+hijfRM81d5NqXJXojlv3x3DPgL3ts63KaMW+tyqZXKphVkHqPfi+LqhElnmmzY+BdN
         X7MYgzbHwOw/8f3shfCVnvkSrRznLy1lcjn1n+qjZJWGfc+scgbKbfu74k5yvaAHljpp
         UNxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776698820; x=1777303620;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=jVkE30hQ08LQ7R5FThqKLE6Uk75qf/KBDIHUXGckQOk=;
        b=fM4OK6BXufvuJDHQXFhcNoJRdaLrMwxqq8ZZzvRWLQwhHzrrfpPewJeZpqlfA8dPhp
         js2rd1LbbtpNv5X2IrWwJ1Q9nmTjhbNNmAb6L/pTascAnEUQm7hq2LbHE+IiMLyzV2vX
         4cCHlET5ccuhDJYlbaDzg/GltU4wTjuVgX+6+4mqAfnnuZiasfPCoC4P96DgYR+byY5y
         qjDE0c9cnJfqOGjNeVjcd/8Brqrm3Xl1Q81Ctcdw463xSWgFk98ZqVUoCY8pkYV/dbTH
         dbE+UlFWNx+6hszpgypFejGPi8DaQdyS7TLFaCYxVCM4o44fJrZAKHsQy/bvtAh5T2A6
         /4NQ==
X-Forwarded-Encrypted: i=1; AFNElJ883HabUOCw2x2+7cvVSylKsFPaVziBpU00LZTWi+1zvUgmMTUXrbClk/1xy2wwjPrBoZ/x5Aw=@lists.infradead.org
X-Gm-Message-State: AOJu0Yz+ywyYtQvwJf6Vx0RAQl7YTPnc/DXn+2eWUIE+rnwLRSf9b+0F
	ksA7/kxIJK5o7CRjzBJLDCzv6veKVfDpoUr+FOBRdmPmbfmeez2W4UUOZ9iPiqUWJMKPjjtTL9g
	ep9DcXRgQ8s4gTe1YyBM3qbc9YSOGQP9BmYx5XT3eMQMVIkwfCmy+OfTHRG2cLJTdgcx68U9i
X-Gm-Gg: AeBDieuPgysjaM0pb0acvZfLhTTH+4m4NVwNkW0rde5ru6pXR4T36ZOQkuDl4uZSFiV
	EymAhee1V4GBlFgY+qkwatCKUQ3ro7O1OnLPvDxz0kzgDYcpv36kKDsb1mOIfhRub4FpuNrxchl
	w6WjogwLluoBeSxocZctWaFYmWDfs+HHg2/5rR2KUtcMZMBTITnb5guJWdgpf6gXoxEFlmtUZ78
	hkncfzCRr4KZmusJVQnv6L96NUFMIvky6elJ49fXiLm/fWCFXHvkD5DGz7PP5MgFoqo/1Aspw/r
	ieZa/WGdqR/b+aPngWtAyCyCJNaUFJnBSNXQod/VH5rAhc//AktOPkz67WVJQP8EU23iVyGSjmh
	DClNQKqnhrrIAeze6K0kPnAOphas57BXfrwLy5XkuAkvqU5TU/iuQQikzGwbMtWg10qDPQ41ZzW
	25n2AJ5d2GgOg=
X-Received: by 2002:a05:7022:2602:b0:128:d23d:81a2 with SMTP id a92af1059eb24-12c73f9ae5cmr6881009c88.29.1776698820245;
        Mon, 20 Apr 2026 08:27:00 -0700 (PDT)
X-Received: by 2002:a05:7022:2602:b0:128:d23d:81a2 with SMTP id a92af1059eb24-12c73f9ae5cmr6880978c88.29.1776698819448;
        Mon, 20 Apr 2026 08:26:59 -0700 (PDT)
Received: from hu-jjohnson-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-12c770516f1sm13775671c88.7.2026.04.20.08.26.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Apr 2026 08:26:58 -0700 (PDT)
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
To: Jeff Johnson <jjohnson@kernel.org>,
        Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Cc: linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        linux-kernel@vger.kernel.org
In-Reply-To: <20260409-ath12k-htc-proto-v1-0-cda86d6355f1@oss.qualcomm.com>
References: <20260409-ath12k-htc-proto-v1-0-cda86d6355f1@oss.qualcomm.com>
Subject: Re: [PATCH ath-next 0/2] wifi: ath12k: Consistently name struct
 ath12k_base pointers
Message-Id: <177669881838.2486446.3805599461059578232.b4-ty@oss.qualcomm.com>
Date: Mon, 20 Apr 2026 08:26:58 -0700
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3
X-Proofpoint-ORIG-GUID: 1VvKqk9N7ufQjR32G3xfcNfZfSIKJcmJ
X-Proofpoint-GUID: 1VvKqk9N7ufQjR32G3xfcNfZfSIKJcmJ
X-Authority-Analysis: v=2.4 cv=TK11jVla c=1 sm=1 tr=0 ts=69e645c5 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=bC-a23v3AAAA:8 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=UDxKe0bwUzp4W916UMsA:9
 a=QEXdDO2ut3YA:10 a=PxkB5W3o20Ba91AHUih5:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIwMDE1MSBTYWx0ZWRfX/FgagZD9Wgkk
 ZktO/I3NSNflEdOJzFhVHDf/JsqSxS9JlIDyIxmdj5hhbwBMBX4jP4FaT7YX2Td2zMXr0neOLvY
 QUJyn78S6zO6+hC3Q4B8PvZNca7etDKtnQEoj+de1Q0tQFepTQog1+z3qdschHdmPtEZnbK+hJo
 rxE87lC4BqvCvxANXpCXzuCfSMxcF/i8nYKt7HpLxtEp5Y7nH1jD5oGeW5m2/ouG+vrhV68dJxv
 5kRCnjHgZr5BK4s+Achgd3qu6lmb2k97tBWckfJre//+XVE0STCcVItb0iKtH1f/n3W0DZ2OMja
 nWM830d8jQdSdO0JLkFe++J/m2mtgEf9H7cmvxMAnA7A5LUlI9m1ld1GFfiCSDM/ba5gM6Q3I4L
 TPFU006l8Qc4GbqoGs1kLNz4rbozO+2O8Nx9GZIpaU3BD6n1bD7wqYv81ZaLUCzOcCKGikbFwHi
 FJWV6TTl0+IPZkwUaOA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-20_03,2026-04-20_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 lowpriorityscore=0 malwarescore=0
 priorityscore=1501 suspectscore=0 adultscore=0 phishscore=0 spamscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2604070000
 definitions=main-2604200151
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260420_082702_885927_9CB1220D 
X-CRM114-Status: UNSURE (   9.03  )
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


On Thu, 09 Apr 2026 11:44:22 -0700, Jeff Johnson wrote:
> Per ath12k convention, a pointer to struct ath12k_base should be named
> 'ab', but there are a few places it is named 'ar', so fix them.
> 
> Note that one instance in ath12k_wmi_tlv_parse() is not modified since
> that instance is being removed as part of:
> 
> https://patch.msgid.link/20260407095426.3285574-1-nico.escande@gmail.com/
> 
> [...]

Applied, thanks!

[1/2] wifi: ath12k: Fix HTC prototype ath12k_base parameters
      commit: a49300ad9796e59f2eb740c608ccaf6b1621a6bd
[2/2] wifi: ath12k: Fix ath12k_dp_htt_tlv_iter()'s iter() signature
      commit: 90ef329e73c673e4e3ea66226bb1d8fe3acf45a5

Best regards,
-- 
Jeff Johnson <jeff.johnson@oss.qualcomm.com>


