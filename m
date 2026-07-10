Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E057AC43458
	for <ath12k@archiver.kernel.org>; Fri, 10 Jul 2026 11:50:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Bt3ZzznhWEvrIU6LXkjK0Fr8OW0aQMQr0vzrLr2CA3g=; b=1XDN2yHiU6G5fxXverAQjboBZ/
	Xlpsoz1db45M5KtzcVZBBOn3xVJAOBBDGNKZ9QkDBT+CpMXRWiVnlngsmEArwMuSNJfyphe9YNhgZ
	eSVbyYa1+9POB2KxrFW+h1FMsDTv33aJYxntPOTW7bIZPraghn/ercJ2Zdgor3DgV11tg507vTEKz
	TNS0lWpal2EkBPTepb4iDGzPMAQqWL9oWc3TRvxSK+j2e7hge1QE8h6FNC2dqJ6b4mI9jn0W1vssH
	aZy70uktQ8yLbL3MW2fi8oyW9kYGAMGtYjbzukDHwTYS4Dg047nqHQ5oY49Ukht1iWbqo0SWziAxq
	keK/h4sQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wi9kd-00000004rLi-2peU;
	Fri, 10 Jul 2026 11:50:39 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wi9ka-00000004rLD-3hHf
	for ath12k@lists.infradead.org;
	Fri, 10 Jul 2026 11:50:38 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66AAmS4g569218
	for <ath12k@lists.infradead.org>; Fri, 10 Jul 2026 11:50:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Bt3ZzznhWEvrIU6LXkjK0Fr8OW0aQMQr0vzrLr2CA3g=; b=PngctOSDoyCHV13e
	jg8O7HgcMb+GnKHrKnmf9jSNDHA95aSJZhvGlQ+TGtrHD8jN92waTv7mUSpCayLO
	YdEOjjqf4d3D1xJIacAF/XvRCjqbXnAk1KunFzQ/V2TcLy1WuvU1euLMER8ZCDmX
	FAy4JLwz8h0uYJEfNs4hAmzggUtcf+qPo06NNW2vPZ3Hq1JrCJUwxZwPmixs3Kf4
	CRgJw/YaeCL0trB5JJvPqBaGEFdcU5ofbADIbQo0Kl/WK14h2SxO3J0+CAPV2dho
	WNMoEPdIxoTqneY/w6SsZa8Ynh3oFmrVg3Rz62OpD4sc2e6ruyhHpyh8FwPyWTeP
	p8j3ZA==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fax5f8fvd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Fri, 10 Jul 2026 11:50:35 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-38869800848so1620135a91.0
        for <ath12k@lists.infradead.org>; Fri, 10 Jul 2026 04:50:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783684234; x=1784289034; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Bt3ZzznhWEvrIU6LXkjK0Fr8OW0aQMQr0vzrLr2CA3g=;
        b=F/Kp4wNOB3uaMBEt/RgNvWJLuq10DYGsaFhCsbIwDXIo1ZbreVIHh7w1u+SelTQvVi
         Ak2w5AdM4YtkmooNF1OCMmaR47F4P+M7wp9NOiGHKe5qpC3SvOL7ao0T0PzOoa+C/UUo
         JhFjiZROu7Q4gyvNpuEd8zpc4qbAN3VRM34zi1x0lfaP4p5kChTDHs+d+9cOWn4rkYv8
         qb5+5GSlDhQPmgKDFWppc0icTWBheAVYnMymsOuQR9QhuI4EvReTuIP2AjLxF7uIsVef
         Q/1X/VQeB9LItJ01pxyqquRoUte6v69GjjtpbDAW8WRPX/UQ/2adITXqYEPTmKLlzpak
         87hQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783684234; x=1784289034;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Bt3ZzznhWEvrIU6LXkjK0Fr8OW0aQMQr0vzrLr2CA3g=;
        b=H7vXSJ6VTpW+EO3LyzL3RYpf46nH3wmFhnRVyYm21a0b31oBU/X5Z2OIK6MVMJVhp5
         tz10qCtcHdn5pIDRCpcBFevPw35/k552uBcHTFmhWUqc5/UmfsRMB3MwS3rK8bQRTw2j
         tQwO73RIkL7mEmRQOdSLi0RyBtCpueIcht9iXDTaO0nZh1sKRjBi21yfpKoHMeyMbZOp
         MDfi9dO0dl7Te35ReBnx+MkNGxAz42Eay1an0s0FoxUiViZnOdC305LbhkEXwdyRA3BL
         qKQhQAbpLY1Z4K+wLPPcaIT4+cegaj5lzs3MizNGF4hKdwwgI2ESrdEWdN5/q/13071J
         ClWg==
X-Forwarded-Encrypted: i=1; AHgh+Rp1bVQeUT96iCuDCFtlW0Jl7UySCPRusXWccm8C8U3eAfmTC0AGzwasCaMvAJZ9UkgvtziH7EY=@lists.infradead.org
X-Gm-Message-State: AOJu0Yzgm8pYmM5tpIi8i9bUB7Yv+JymPb1nQjDa2hTW/TjKKfHYoh5s
	PFTdfWw4nqlq8aVywmM96tIk41moOqeKaJTwhKs653HfrmUpN9/7AMbZGkzLCl/hED9kefbFw0F
	6HW3WLvnNDpGnvFF8167DegAk0vxD2W8m8WCVfdDlVB/MoSSK8HkBwlED+OTi/3UL
X-Gm-Gg: AfdE7cnoZAt7RFqhYO7RbQkr1dMLm/3sNtKyY70u3epyo3aIA4pWWjmOPOQGoLUTWq1
	LyhYGJxZSgbX4lrn0HYSGVe3r+l6Fpd5eMqwFXEoK0FpRQ0tfFLS0CtboAWYNWTQOPNk46Q115T
	rrnYEr/Slq/rYAp//azx1gg9drolDTF2OXJFM2QvlxnxgvEhXDPNfyW0jsKxOjKWfn8dEHbFZjm
	4JwWgGR2Q69kMC5+/4OlvfFL/UWH87eFefkOfN4wwOM3giEkGnDDEG76OYFkNy/kyz4USun4kw9
	qr/TeDWiKBwJjpWMLmAySKu7e/ZJg1WtYImrJ5MTVKaU9cE+3cqD4s4xAIRnEZ4MDKqfNLUF26n
	T1Rqe6Kka8Pp0ByXckPWS8C4g3zvDljfRKQyxCIuryce0ioep1zM=
X-Received: by 2002:a17:90b:3c4a:b0:381:21ea:912b with SMTP id 98e67ed59e1d1-3893f693923mr10301572a91.1.1783684234125;
        Fri, 10 Jul 2026 04:50:34 -0700 (PDT)
X-Received: by 2002:a17:90b:3c4a:b0:381:21ea:912b with SMTP id 98e67ed59e1d1-3893f693923mr10301530a91.1.1783684233529;
        Fri, 10 Jul 2026 04:50:33 -0700 (PDT)
Received: from [10.152.199.23] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-313b9ca880fsm1014309eec.23.2026.07.10.04.50.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 10 Jul 2026 04:50:33 -0700 (PDT)
Message-ID: <be226b9d-4d47-4aad-84dd-3924017346ed@oss.qualcomm.com>
Date: Fri, 10 Jul 2026 17:20:29 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH ath-next] wifi: ath12k: update IPQ5332 BDF address offset
To: Aaradhana Sahu <aaradhana.sahu@oss.qualcomm.com>,
        ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org
References: <20260710053534.879233-1-aaradhana.sahu@oss.qualcomm.com>
From: Rameshkumar Sundaram <rameshkumar.sundaram@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260710053534.879233-1-aaradhana.sahu@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=Ab2B2XXG c=1 sm=1 tr=0 ts=6a50dc8b cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=viQb0OZrn-eQzSfuS2QA:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-ORIG-GUID: uCV7NCsbTqunk6PiRfeHnwQuR7T_gEUm
X-Proofpoint-GUID: uCV7NCsbTqunk6PiRfeHnwQuR7T_gEUm
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEwMDExNyBTYWx0ZWRfXxFbasd8V5euN
 anaDrRuaTNFnF2U658wZWmPUsOA+l3kQlD6vcXrR73Hd4p/fJ12xjUmPZvBYG+ibjxKuHcGzsxx
 AjKQNZDiyD+IQGto0H6CXeuGp8BKQCc=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEwMDExNyBTYWx0ZWRfXy1jduF1Y/kU+
 LNHSsOJhlJ9Gi56d0hjbH5+ys98fPUsJfFYvQc8dsVWw2pWlZoxt7LuxRgdNUVqqNOfhQhY0z2u
 OKrQMPIU1NGro6/UcBmvFt85FlKv6sNgmyZP/7xR9BUGpKj/PH/c6f431bEI+tf+8YlS0UjYanc
 134JI6ehDEYJRgaeZ0mIvCcPbFThRBBXy3+hh9tAdUmbd/5C8PRrNUPoJLJC8zECnJYXHIE6czA
 bJsY6vUpB9wlw4rxhV3OT6k1/ScQF6aAyLyxRA9VxGQuKxYNILLfYP4ahA18qzO1mE4t1vAbOPO
 etTQ4qxa7zDU0Vb4HKSASFGoUUe2qU7N5IkyByjtBXlEbUxfxODlWW5HL96Z8AVuhmM2LxfiRRJ
 vJFInYF5VT3DqyVKHpQm00x5wk0R8AazSu7TGsUTYElwdOWe/WHc7c6eFdTam4l4Qp4Sr5WWrNO
 VnpIhsy0qcfKmS9oP5w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-10_03,2026-07-09_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 malwarescore=0 phishscore=0 bulkscore=0
 suspectscore=0 impostorscore=0 lowpriorityscore=0 priorityscore=1501
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607100117
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260710_045037_041774_2579F6A7 
X-CRM114-Status: GOOD (  11.31  )
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

On 7/10/2026 11:05 AM, Aaradhana Sahu wrote:
> In the ath12k driver, the BDF_MEM_REGION_TYPE address is derived by
> adding a fixed bdf_addr_offset to the WCSS Q6 region base address.
> 
> The current offset (0xC00000) works only when the Q6 region contains
> the IPQ5332 ucode alone. On some IPQ5332 platform variants, additional
> devices share the same WCSS Q6 processor and place their firmware
> ucode in the same Q6 region. This results in multiple ucode sections
> within the region, and the existing offset can cause the BDF memory
> region to overlap with firmware read-only sections, which can lead to
> firmware crash and driver boot failure.
> 
> Increase the bdf_addr_offset to 0x1A00000, determined by analyzing
> firmware memory maps across all known IPQ5332 platform variants. This
> value represents the upper bound of the largest combined firmware and
> ensures all IPQ5332 variants can allocate the BDF region safely without
> overlapping firmware regions.
> 
> Tested-on: IPQ5332 hw1.0 AHB WLAN.WBE.1.6-01275-QCAHKSWPL_SILICONZ-1
> 
> Signed-off-by: Aaradhana Sahu <aaradhana.sahu@oss.qualcomm.com>
Reviewed-by: Rameshkumar Sundaram <rameshkumar.sundaram@oss.qualcomm.com>

