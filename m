Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD49EC79F82
	for <ath12k@archiver.kernel.org>; Tue,  8 Sep 2026 16:30:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EoFoWH4TXhUpMWfgBmpb9HIW4dVO2c0QaSn6V5lFK4o=; b=TH1v9IPrBMdextVWp9gKA/8SUi
	DGyZYrdO2wwFOua35i9kJk6ZSVCEbrG39gOfbLTbfDuVWRBQ47XZKBHuGzWa1IQjn3TxMpO91giya
	EA4K3gdEaeKBYaPQ298gwkgfIkEM+sfLu/Ii4f2HqepX6h30Z0XMoKSfnChWiNAsF7pawjBip4izR
	yIStoKt1/Tkm7i1XgDn/5dwNNA7zi6ClQn0Wqe2FoxWGyrEh9FR05R3s1tJbEBLpwy19xf9JnqTDU
	bfqG7dBppyheLM8svDwXuORv27+eYazLJ+spt1/ETRa0p0MqMVvKTLP1Uov+7AXpLqu4C68EnIo7p
	T5+nnVSQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3yhz-00000009fyA-23gT;
	Tue, 08 Sep 2026 16:30:07 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3yhw-00000009fwG-1l3R
	for ath12k@bombadil.infradead.org;
	Tue, 08 Sep 2026 16:30:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=EoFoWH4TXhUpMWfgBmpb9HIW4dVO2c0QaSn6V5lFK4o=; b=kxY9tiuLXm9eK9HjWYNGr4Zlty
	8rftp3dlQSoohi+rj5pkXmeJuBr67za8HP1XPiWnaCPwxki3oNgPIKzG5rZB0XoliSs3AYIr9RszY
	lq9rm1yoO9UPrLuDMy7GlSbuD5GvBI5pceQwtU2VpGYF+VLC2ZF3SY8vjD2aV2UFqUGXZxRV2fr4X
	/fszDbopduuAoT5vQyGufJX77TNMYz/fqzRBkvHNdr31XUVSyOPb/meCHUTZIHzXqMylnjra0oJeU
	7wDqIlvqgoot8Ja0PZZ0NIHOtFGfb1Z/p4QT3tJQqIZc/DR0jBbX+qdos9SNBJtoTRG5gEOiNchTy
	Gy5Zw01g==;
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x3yht-000000005oT-0TCl
	for ath12k@lists.infradead.org;
	Tue, 08 Sep 2026 16:30:03 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 688FdchI045597
	for <ath12k@lists.infradead.org>; Tue, 8 Sep 2026 16:29:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	EoFoWH4TXhUpMWfgBmpb9HIW4dVO2c0QaSn6V5lFK4o=; b=Eg59EeX81LxGTeds
	0FI+O7phSM9xwjLpwpZuSsXY9FckdWewcTU74/7n0oT2XAQMw7jAkkP97CND8ruC
	zVDUDOqgWiiBgeZTGP0xBOnwPx7PrY99czv7WDtxRkYVD55sNnJzmWaF3RpNe4uR
	tVLyAjoJ841RLMO0hcGmYRm080GLNFIgQG7tII1XaEU1fT6hONMVJxF7vzbb1Hm2
	9CcRqSJpag6ii8ffEECYO7WiX+QDQTUQ7EU8W96/QoUj72i9yn3WG6usE5cjZFZ7
	bpxV5qeCkvswLLUeHshijEP4KptVpxSkAXxHQR7pat77ssF5m92BSoRV7ilfBMkx
	n/nGUg==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gjg8xsqfc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Tue, 08 Sep 2026 16:29:56 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2cc73f47bdcso57767625ad.3
        for <ath12k@lists.infradead.org>; Tue, 08 Sep 2026 09:29:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788884995; x=1789489795; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EoFoWH4TXhUpMWfgBmpb9HIW4dVO2c0QaSn6V5lFK4o=;
        b=FgKpNLLsz1Z3Q1E2AVOsLa0Imsodttyf0EwQRpObwN7twsxaXiM+OPtuwiaBfFBQ6z
         6W5B1XIVc4XMLNXvj+XHe7IDm3n/tc6k0rezENTdGbOY+IshJbHpIghnvujSGuINQt9T
         MQsCIOpEgcYKY15EAlLxGD32IAPHC2hNUR0BeoA2eanZvTLDNwJJRmiIHT16B+3E2p6c
         r2406dGd6g9sYZe6PMkKXubwwFH6KMbO2KaXyP5hKi/KVGs+86AgHYaM79yAI6lxU7r1
         rAWw/5SIiM0hKs7VEeNbPTTn/w+vQo+DBJcKc6VciI9ZxHdYpkfLhwh6Fx3ntZ9stmgo
         liOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788884995; x=1789489795;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EoFoWH4TXhUpMWfgBmpb9HIW4dVO2c0QaSn6V5lFK4o=;
        b=Hn50CdA5eD9PS8k3J+k98cjc83VXWNMmK0sxNQdS5YU98Fw6WPIueWc4xdKK3ptK3h
         XU6/Mb0wYVbFAileAg7BU4bALt6S0FCQSN7e328c6/WxY1qt8+jDK0hzlHnGWEwwjdUF
         TreprbgFY3X1Zz40e218bA/P9zyL7XGKn8ond7X+CZretq7y4ZZPpRHLhgGD4KTp5W2j
         m/C6MHCKq4QF97H7T8HMbx59i3FeOjnFSlrqPYbMGJipIKULq25F84J/bNk/Yj1qPC2L
         9rzPrAmFECd2CS60AtTweSW4HuO5CMkRakXKh2gHpQVioeXm3pF9J1CdR02iOwHeo9O8
         z7xw==
X-Forwarded-Encrypted: i=1; AKwUvBxRTZqpFC18zqtWnk8VXp7jflAIOZFceGCa4yPFAe0qFoSfuCdDP1jMLR+8U2mesbLO9CYCvzU=@lists.infradead.org
X-Gm-Message-State: AFuF++n5M/rMShjhBJD4EatmKn+9saLZUGfndayYLA90qtJmA3La5Op2
	To7unMJqx+nHBqrsQ/CLTMfssuFYJlr5+x45XMPtNMSkZwWJAVNNka9ttbB8Tjt5vUaSaQMtDq9
	K5vnXVQgC2cEPRyyrjFxCgLSxwcHouCtPxRtxDM28qA8RSY0U/7ggk7dYbqd0Fl6c
X-Gm-Gg: AYBFou280Y0ehyEW9IiqqzeSJi8YVNe+2I2MNrDmmlY8LC1r3Yzmsf3/+tepNvYye0Y
	B4oqqHagsDfwZdO2Ege62TWBKNsQGIheG8zcxfpMZ3st3MHaKRjk4Wf0Pleo0XEGuOzW6n+DJXZ
	hJ+sdCTS8JfLS6RE9aPeezhr0PlLZ+vEI28MIeO7O755NALPMAOrgDXhBePGXZiAzovavqWN6U0
	h13SMPuHDiMpNjTkL7l9i08Pi2Ln4lT1oAYb3I0kPYjQWvDjzja6EVE+mLTfBQi1JtIkoar8GWd
	eSCVzLqvSODjCzsGgOHDBpPI4qTE1NPbIOJuNY4b+z1Rk5/roQc/SEB7wOGJSQkMG/pMN46ZmS9
	5QhJ476dmUIYhG3sTLBqHOlpZkMgvxx1cgLcNzB52Ifm7hA==
X-Received: by 2002:a17:90a:149:b0:39b:2b10:d05c with SMTP id 98e67ed59e1d1-39b2b115ba1mr31443475a91.5.1788884995355;
        Tue, 08 Sep 2026 09:29:55 -0700 (PDT)
X-Received: by 2002:a17:90a:149:b0:39b:2b10:d05c with SMTP id 98e67ed59e1d1-39b2b115ba1mr31443418a91.5.1788884994745;
        Tue, 08 Sep 2026 09:29:54 -0700 (PDT)
Received: from [192.168.0.3] ([49.204.140.17])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-14324410092sm34573025c88.14.2026.09.08.09.29.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 08 Sep 2026 09:29:54 -0700 (PDT)
Message-ID: <cbbb5555-60f0-4a4b-881d-403decc53ca7@oss.qualcomm.com>
Date: Tue, 8 Sep 2026 21:59:50 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: ath12k: QCN9274 WLAN.WBE.1.6 firmware drops pre-auth EAPOL in TX
 encap-offload mode (WPA 4-way handshake fails in AP mode)
To: Michael Pfeifroth <micpf@westermo.com>, ath12k@lists.infradead.org
Cc: Kalle Valo <kvalo@kernel.org>, Jeff Johnson <jjohnson@kernel.org>,
        linux-wireless@vger.kernel.org
References: <app7ADVti1eiVQr5@mpf-ESPRIMO-P9012>
Content-Language: en-US
From: Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>
In-Reply-To: <app7ADVti1eiVQr5@mpf-ESPRIMO-P9012>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=J7GaKgnS c=1 sm=1 tr=0 ts=6aa03804 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=/3tNsvzfJk1ENl4L86PcmA==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=VwQbUJbxAAAA:8 a=xENxMKR8wDSH8ws2yF4A:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-ORIG-GUID: NVFO5ihlqoUh6OCcbQ7y7TNZL3tl_Sos
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA4MDE3OCBTYWx0ZWRfX/YXKK+WPje8d
 Tu79GB6ywWPctvpPlGCWcYMJtihUw//25zFGgPKMhPI5Svt1c1T6MjdBOn+T8kwhkcvOVP+C0nA
 AxLdQDLFKYILXGYFmc+mKBBLoPNXaJNh95kK/2M/jZTZok/YMHVt/ChGBoIFIwcwOBuND9itYny
 2JrZlW5+YftapddOtk3XnA4/Rjs6RRIhCJl2hA6aO+9fUiOSaw+mh8SXCrJjJB0s3IPUhqvJ0/I
 WyMz1Qp6NTvsz3RzqnbvlCWYICm91kv5MCC04AoBepGpmKIZNU0iB5ZbUoi2o+SlFVGpm+/j6xL
 zgljG3fLrdu0ubVZh1s1t6FjCD36SQXpPXqvw/OK3eaOpmijBAkRueSAieKhQt6KajvIN5WFF3O
 sI8by08CX2g1eaRvF7cbuN6YN3otfDymbEOVNpGZxfIFu4SH20ZLfyg9dZYj8uz7hI6A9lQJKuU
 hV1MRFGIq9x6YyB7CnA==
X-Proofpoint-GUID: NVFO5ihlqoUh6OCcbQ7y7TNZL3tl_Sos
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA4MDE3OCBTYWx0ZWRfX6OjNbTqRUG0s
 pucClA0UqVh2REFI+ArG8V0mjYlKb/W6te5eHzu58E9879jmUuLltp3900+CZKkgocg6G89Afit
 nXgjMop0tp9nox1JjPEZT5NImR5YXRE=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-08_03,2026-09-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 suspectscore=0 clxscore=1015 spamscore=0
 priorityscore=1501 impostorscore=0 lowpriorityscore=0 phishscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609080178
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260908_173001_551890_51A42010 
X-CRM114-Status: GOOD (  12.10  )
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



On 9/4/2026 1:32 PM, Michael Pfeifroth wrote:
> Hi,
> 
> I'd like to report a firmware behaviour regression on QCN9274 that breaks
> encrypted AP mode, and ask how you'd prefer to see it addressed upstream.
> 
> Hardware/platform: QCN9274 hw2.0, PCIe, on an NXP ls1046 (ARM64, little-endian).
> Firmware: WLAN.WBE.1.6-01243 (QC_IMAGE_VERSION_STRING=WLAN.WBE.1.6-01243-
> QCAHKSWPL_SILICONZ-1, fw_version 0x160484db), from linux-firmware
> ath12k/QCN9274/hw2.0.
> Driver: ath12k, current mainline / backports.
> 
> Symptom
> -------
> With WPA2-PSK or WPA3-SAE in AP mode, stations authenticate and associate,
> but the 4-way handshake never completes: hostapd (-dd) reports "did not Ack
> EAPOL-Key frame", the EAPOL-Key timeout retries exhaust, and the client is
> deauthenticated with reason 15 (4-way handshake timeout). Open/unencrypted
> APs work fine.

Worth trying with commit 
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=1e33f8acd837420160ea088160d8648a3db54c3b, 
if it is not part of your image already.

Vasanth

