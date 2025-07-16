Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 325A4C83F22
	for <ath12k@archiver.kernel.org>; Wed, 16 Jul 2025 17:11:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AvZu+s6FPUG3iM8B2iDP144HoBABMQMyB2lUuofN4v8=; b=HDd+L7Ysf824xZGD4BXhNU26qU
	fRnr6Dfsh/1FCZlvAAtOGUzVCvO86b+jRcZG6tUrOOB9tTKuD2Tr3d84w1+GOHSKkDzkCnlZGI/IM
	qCrYduEYQ0v9COzTHMyqDCAyDZRPhOvU5ABFXj7uTiC03nPB3dDEU5HPDXDk0ozhkNh7dSnX+oD2K
	wKR0edj09P7aqjzqBx3JLJQgUKsWpD3K5Zd9m7Jc05A+SqqPG8cgwaeNW8wARFJ8hBTw0Jf1xJuVr
	tQO9rsjFS0VNop3k+wvH2xu5kx4+nyMFAuaFqTKEHZgOSlkNBh+ttyTHnDvErwWFerkNzvTyAsTGu
	doFtlf6A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uc5fP-00000008GZ3-3krD;
	Wed, 16 Jul 2025 17:11:39 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uc5fM-00000008GXZ-45eR
	for ath12k@lists.infradead.org;
	Wed, 16 Jul 2025 17:11:38 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56GGDjBm024612
	for <ath12k@lists.infradead.org>; Wed, 16 Jul 2025 17:11:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	AvZu+s6FPUG3iM8B2iDP144HoBABMQMyB2lUuofN4v8=; b=lcrgpN0RS21s/wFj
	BA3V9E2v1JVAb0Jubcya9oPGT/MF+0yYlDwuJymmhDfnmwOBvvSZbbRcJCBu1TOY
	8NLV+BAE+cMui13Nej2B0JwpSsfbb4p+XU1HEM8aFm6g/eSVLKdLXMhUan+Wo37U
	LyaF8coJAdDXauV/J+qOph7zsKyDCWH2iAWQGHe/M6upStdCLSQNHLxJHs2xdLyA
	3EyrsJuzQ5fqObKx9gfBbbjcyyVvdCO4R/aO/aN3jLhSi+KVjnO5pgQcPhEFwVp/
	8OZdVTpXIZiVJPZLCb1QIh2yqciql6cFRNZ8xSj9ykqhbeAsK6/K1AvK9BPDslu2
	Z0w+Ag==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47wkrunjja-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Wed, 16 Jul 2025 17:11:31 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-23638e1605dso301245ad.0
        for <ath12k@lists.infradead.org>; Wed, 16 Jul 2025 10:11:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752685891; x=1753290691;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=AvZu+s6FPUG3iM8B2iDP144HoBABMQMyB2lUuofN4v8=;
        b=eRnY/r4imyx0feOkLgv7FMye8UhYsBjIR78a7DE9at6VJzKf6LBpDUBy3pdqMJ80Em
         EjNcR+mnu8XhX+PLmCOnMrGk6dFEHm7PxICyGGv/9LID1fe98iEh6Nd8G9MT+6kVfdTA
         k5d4P0iulr2pZPRL9e7eB6yM6eMAkWdMnpd5Rjyl9YeqJWeVSdEWoALJvdbfEWoMAo35
         Dx9JYYZmY0xsuCOiveQ24ktgxRp7t2jehOPGXOTy7pbUOg02qEd+c5CbdX36nkKrtuBL
         aBCCdBG3IXuk0ripJsWfA1L+gmVRsDb2Zq7IvmHwRSJ3qbbDt2i+TBYC76hGmzQmVEoU
         sKdg==
X-Forwarded-Encrypted: i=1; AJvYcCVP0HrwLXK+naFHTqx681ZTnSq78zqRxhlXyed9h9uNxOst9fv198LdVSSwvHaidTvKrxzS/9w=@lists.infradead.org
X-Gm-Message-State: AOJu0Yxc6ywWfQNBftVEHpkq1EY3N2a35DsopXEk7xz1hvhJ1N8uA4rB
	he0wLc1IXv1OUo3CzvaHkigE8yYz882I5YxGDff5MuIihMJo0YRWWCATJtp0ifEHUexXu+GBaAI
	MVi8/wY+QK7B03A7EkJArtUO8vV8YqvRfxMyiCrvTvHd6R4E8hliekVMzhnOEamyv
X-Gm-Gg: ASbGncvlPMhZmCwApQtE/EQuGEQp1VvLCnhazct/FkbBdRagKoQ/lOFHdHsXRTAJO4m
	RPA4eL55F7g7V40OaN8fCKNIEvo2RfmhEGuAKoczu3eLzhqvZZ4lNfxF/IMbqIMRfxUN+NOb3A9
	GJkDlVOgAKKUW4Tzi0JWClHqh7sBIfBx3i94Shd5IsaYBM+y7gMsu/Svhcust3d/v7RuaAxmdQH
	w/AMdQh1WE4xW1WkHJ6VV9updQVPmRYTg1LxZNQvTEC91Zb71SuR93mmGAgi3S5ZZjuqm0O+w81
	GBSJMsYB9r7P2y2+etT1z7cn5VsNXQAIJacmiTr2KqnxWnmIuUJIT+5X+uB1H4Pfh4UOstjiIJJ
	Ff1CpGklx9jryKxiSO1w=
X-Received: by 2002:a17:903:1cf:b0:235:efbb:9539 with SMTP id d9443c01a7336-23e256b6e94mr60970245ad.17.1752685890512;
        Wed, 16 Jul 2025 10:11:30 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHCaXQ8h/tJKVUb7+n8ZsAIn5RASnIJXRAkFzeIQw6HcoivPyubiz6hlD2vF/imJdL6JmfECw==
X-Received: by 2002:a17:903:1cf:b0:235:efbb:9539 with SMTP id d9443c01a7336-23e256b6e94mr60969775ad.17.1752685890010;
        Wed, 16 Jul 2025 10:11:30 -0700 (PDT)
Received: from [10.227.110.203] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23de42abd8esm128205355ad.54.2025.07.16.10.11.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 16 Jul 2025 10:11:29 -0700 (PDT)
Message-ID: <f3374104-684d-48c7-9e2d-e97dd48700e9@oss.qualcomm.com>
Date: Wed, 16 Jul 2025 10:11:27 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/6] PCI/ASPM: Fix pci_enable_link_state*() APIs behavior
To: manivannan.sadhasivam@oss.qualcomm.com,
        Jeff Johnson
 <jjohnson@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
        Nirmal Patel <nirmal.patel@linux.intel.com>,
        Jonathan Derrick <jonathan.derrick@linux.dev>
Cc: linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org,
        ath12k@lists.infradead.org, ath11k@lists.infradead.org,
        ath10k@lists.infradead.org, Bjorn Helgaas <helgaas@kernel.org>,
        ilpo.jarvinen@linux.intel.com, linux-arm-msm@vger.kernel.org,
        linux-pci@vger.kernel.org,
        Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
        Qiang Yu <qiang.yu@oss.qualcomm.com>
References: <20250716-ath-aspm-fix-v1-0-dd3e62c1b692@oss.qualcomm.com>
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20250716-ath-aspm-fix-v1-0-dd3e62c1b692@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: w7BtW8Ph3QQcz-hsy1XUnnz-opA1r7I6
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzE2MDE1NSBTYWx0ZWRfX9j5uZ36o4KPQ
 VNYYVs//7Ow1ASbpEASan4qxVVykSzgKq+Om3U3o3btPHE9n0vysDPqo4ELzK51UFRGETRH35Aa
 ubPzdf8oxfhRQ8MvS+BMFaRJvIIvhTTNhOvhtl92wsDf1TiNX+/5hz0BNUVIeBzypto7TXcWHkF
 +v72O0X78fEiBspZzGomragn15tdCo3dOQipbBj9vMiDnxAVQbDWPkU6Lw6meAvrJqsR9Czw5mO
 n4c9/5sWfTKQtDUJBMGG7B+JjIoKrczvNM8Fk9AExDZN6qPhOS7A3qix9MGWH6DaZecyAr53Qdt
 VNRWzasxHuk9KCllKTZwZKVEYurtzfQMwj7dSOxJ0wJm/R3GE9y+oLUjY3P8LEjsR+Qs+6KBxqa
 pVl1UNopZR+X9nEUUIWq18vbeyOCBmI2/tEUyY7oKroS0R4fSlGx9VjHAWao0PvsjlC8usZq
X-Authority-Analysis: v=2.4 cv=WqUrMcfv c=1 sm=1 tr=0 ts=6877dd43 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=rhYh_zIkBfzxVmIspk8A:9
 a=QEXdDO2ut3YA:10 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-ORIG-GUID: w7BtW8Ph3QQcz-hsy1XUnnz-opA1r7I6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-16_02,2025-07-16_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 mlxscore=0 mlxlogscore=453 bulkscore=0
 adultscore=0 priorityscore=1501 impostorscore=0 clxscore=1015
 lowpriorityscore=0 malwarescore=0 spamscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507160155
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250716_101137_173197_723E4A53 
X-CRM114-Status: GOOD (  12.89  )
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

On 7/16/2025 5:56 AM, Manivannan Sadhasivam via B4 Relay wrote:
> Merging Strategy
> ================
> 
> Even though there is no build dependency between PCI core and atheros patches,
> there is a functional dependency. So I'd recommend creating an immutable branch
> with PCI patches and merging that branch into both PCI and linux-wireless trees
> and finally merging the atheros patches into linux-wireless tree.
> 
> If immutable branch seems like a hassle, then PCI core patches could get merged
> for 6.17 and atheros patches can wait for 6.18.

I'm fine with either strategy. In the first case I'd merge the immutable
branch into the ath tree. Note I plan to issue my final PR to linux-wireless
for the 6.17 merge window on Monday, so we should close on this decision soon.

/jeff

