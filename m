Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 946CCCCD184
	for <ath12k@archiver.kernel.org>; Fri, 17 Oct 2025 05:15:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QIKO/DPFg0c2wPpUGqI6aEd9ZsFDZggwxQR6K7a+wa8=; b=Ef7WEwnt5cdP5TE7vJ609gXYHC
	azQQRkd/OEdI+04RBDuqjTd2/K7FXkTLuCl3KRjCTCdgUUlWpKSwsNFwCnhUWbe8eGD375wZ2NQsx
	3W79g8LuV9w7ie8FNYTfjrZIkRmUKOik4BgK20gWyVQl8NH8p2O95c02zmgAbiyKsbDas6LvHWMgV
	xh9AQoREGPKhwajNM4O7X9Evq9xJsdbMJxK/ePiPDuumqzHzK5nmqMDsp/T9GD2V4CM7JL0Ca53Y1
	pJkq3vrtoeiv53fWWyH2PUk7EHx4tkeZ6HNHcrFr9oedxOKw7OfzwHVYcbP2vL+SHjzse/xTnfOl6
	ImBU8nOw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9cof-00000006b8W-1VAQ;
	Fri, 17 Oct 2025 05:15:49 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9coc-00000006b7X-0hnQ
	for ath12k@lists.infradead.org;
	Fri, 17 Oct 2025 05:15:48 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59GKLOv9008890
	for <ath12k@lists.infradead.org>; Fri, 17 Oct 2025 05:15:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	QIKO/DPFg0c2wPpUGqI6aEd9ZsFDZggwxQR6K7a+wa8=; b=FRdYFNLSJJAowr+n
	gvssstqhkoQdmm6b+hRKy8OigSnvsu+dureYFV8wANM9n+NZWRp9XInydCSGN00i
	G4Xx9pLa9zP7JhpOxjAEw5CYSKzViyiS5uk/QLt4wdl1A1oC9KXiRGtTBynYnsPS
	Kppa3sPTySlFNLslcPZHKlDvZCmFSq6eY5xccJeVoCox/yQbUZK5h918DZKF9Iv0
	otcNRaQf7nuJ+dW5onFXzJXLrsXKG7J906RdlkeEUGPD5Inw5ViLvqi67b6xsOOs
	3vAk4GKTdYGXUojC1HpKJu6NAEhmL1NFbJIu76ZlsLskqs9YomosQFSkehi1Xd0S
	RlWdFA==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49rw1aq5ub-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Fri, 17 Oct 2025 05:15:45 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-28eb14e3cafso28451395ad.1
        for <ath12k@lists.infradead.org>; Thu, 16 Oct 2025 22:15:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760678145; x=1761282945;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=QIKO/DPFg0c2wPpUGqI6aEd9ZsFDZggwxQR6K7a+wa8=;
        b=lQJ1sCvuHy/N4SfjwH5lRB3Fg/wOsN+DNYR4Um82a3HYIA5ur84NATKCsM7xsrIHHW
         uVjQMPuZ3CZPFcpng/Wls8subRljPqKemamwRf2DHqQnJhsLx4ak2AAn9ExSfEqv5LXX
         Oc34o9AzFck4j+MEW5mIa6BtolCPBOr08tSa59qZ9vZ56Lxb26/fWiPGFeA+opZ8Q4LA
         oAAzubRSmebxvVoJnbvhY+655W5czbn2KuFFvrPhQoz+I+/Q8GLqZW3QVNvEDv2Dlw9z
         3TZZ36OVRrXd7X7y5Udp1R7ncFyJOjUZNbaA+jrC7hHHQNt578vMNyj93lu47f52QHHI
         WSzQ==
X-Forwarded-Encrypted: i=1; AJvYcCUKRpx7zAYOMoijV8hWZWZXTQUTDLnF72LBtgUDGI4n85fM4oHd3NjsvL/fnGEk0ee46mD2VJ8=@lists.infradead.org
X-Gm-Message-State: AOJu0YziiWH+eckbQti3k8GLzSMEG9U2ApPoWVZduhYROFPWI5fJMoAm
	DBzhKJk+Fpz6DQagwSZdIfWAvpT75jujMPhmsgGJhBDtgDTRr/fyu6MdEn3J01lW9FLBIZ8ELIW
	eBLeSParzVMTwXOeyXhTj0L4bEFzbdIiiwjbd0R0CNA9K96bPyE8FH7YAg739Nafi
X-Gm-Gg: ASbGncsC8Yay2UBkiiu0yokWMdp3BsQjCWDQbRLlFf7U7QSj+wLn5YeUYV55z0n/J4r
	fgIX2etRIuwu6Xoa+5xz0tlhSplzBmcZu43F3AzDfaTbPh6l2AY2zgWXjxU9sS4JMGLAcNTJzLs
	559WQqPHi//7XPJ/FkQEqTCKdt42bajn/vwKyfQ6ijfFCgMY6V4jD8iwolxc5WHEabHUxbN+yUk
	chfUxhYpSJYZwfWBQB171231aNIBlgVhqklbKOP5O8ng9iABFKO6M3UCsgCsCmQqHybBi+qUZST
	uRiP9CZA2GfuXQEczn3cTgyHe9oQgSh341uFTCLr27aTzV/fGmHajqi7SX7k/8UGPuWsFW4DFR8
	I122KspnOTsoUE8uRWd5ZJrKrM8lCdbXTDx+rWFYiBs3SYc+j9gEI1fPkYV60dU8UMUpSlcc=
X-Received: by 2002:a17:90b:2d8f:b0:335:2824:aab4 with SMTP id 98e67ed59e1d1-33bcf8fa14bmr2497113a91.24.1760678144832;
        Thu, 16 Oct 2025 22:15:44 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHp5cDrPQ7jg/bHgX5Tzk4GvQSeanJa1RTvTIKbf6pe1o7S4p+gyeCqev5LNL1xEYrTatcd7g==
X-Received: by 2002:a17:90b:2d8f:b0:335:2824:aab4 with SMTP id 98e67ed59e1d1-33bcf8fa14bmr2497092a91.24.1760678144441;
        Thu, 16 Oct 2025 22:15:44 -0700 (PDT)
Received: from [10.133.33.11] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-33bd79d4927sm1402923a91.9.2025.10.16.22.15.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 16 Oct 2025 22:15:44 -0700 (PDT)
Message-ID: <537f7a80-2e8c-4887-ac47-2cdf861fb351@oss.qualcomm.com>
Date: Fri, 17 Oct 2025 13:15:38 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] wifi: ath12k: Add MODULE_FIRMWARE() entries
To: Takashi Iwai <tiwai@suse.de>, Jeff Johnson <jjohnson@kernel.org>
Cc: linux-wireless@vger.kernel.org, ath12k@lists.infradead.org
References: <20251003082955.11436-1-tiwai@suse.de>
From: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20251003082955.11436-1-tiwai@suse.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=K88v3iWI c=1 sm=1 tr=0 ts=68f1d101 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=2wKZT7uEXQSXzUSAk68A:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-GUID: YCKeKQbgx8DAkCKnnvPSgWSC5uq5Xk-h
X-Proofpoint-ORIG-GUID: YCKeKQbgx8DAkCKnnvPSgWSC5uq5Xk-h
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDEzMDAzNSBTYWx0ZWRfXy//JD5bvT171
 BE8AgqcsvlXwO+b7AWMZF6Z4/+uHUaUP9eggIWcRG3JWmXhd5AtJd89A5dQrJXpmDNLBMePVXqw
 JJHvR29drYAfZ34rK/3PQ0+2f2l3i+7VAXim15HWxNKwyVU9Sndrg4zIgqCQJc0i08oOn0SzuDg
 wzgfTuqSGGwHMI14LZU1myOY0FLCpUD5/VnUuWgsAtPUoH+fEs/Z86SGf0dPlgfL3gcwN2SzB7Q
 JmWBHkaAYHiMatQPzZNKHxCLSat8WqrjdjwtP8GhMHjQWXe6zffy2H89TFHjH8iGyGXxz56VWuC
 hIwoFJZug7/eS7rTk9UVaKddqX2yWBghAasYYA3Lo8KuQ2HehhLRXjG1aKGEHIU7QIMMduwXjUH
 Na8CeiBbmxvqi5roaDi3xryuEifiKg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-17_02,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 impostorscore=0 priorityscore=1501 phishscore=0
 adultscore=0 clxscore=1015 bulkscore=0 suspectscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510130035
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251016_221546_210903_19DE2E4B 
X-CRM114-Status: GOOD (  17.83  )
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



On 10/3/2025 4:29 PM, Takashi Iwai wrote:
> Some systems such as live-image or installer require the firmware
> information for each module declared by MODULE_FIRMWARE(), which is
> currently missing in ath12k driver.
> 
> For addressing it, this patch adds the MODULE_FIRMWARE() entries.
> Like ath11k driver, we can just put the currently used firmware
> entries for QCN9274 and WCN7850 with wildcards.
> 
> Signed-off-by: Takashi Iwai <tiwai@suse.de>
> ---
>  drivers/net/wireless/ath/ath12k/pci.c | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/drivers/net/wireless/ath/ath12k/pci.c b/drivers/net/wireless/ath/ath12k/pci.c
> index c729d5526c75..48161db6af57 100644
> --- a/drivers/net/wireless/ath/ath12k/pci.c
> +++ b/drivers/net/wireless/ath/ath12k/pci.c
> @@ -1871,3 +1871,7 @@ void ath12k_pci_exit(void)
>  {
>  	pci_unregister_driver(&ath12k_pci_driver);
>  }
> +
> +/* firmware files */
> +MODULE_FIRMWARE(ATH12K_FW_DIR "/QCN9274/hw2.0/*");
> +MODULE_FIRMWARE(ATH12K_FW_DIR "/WCN7850/hw2.0/*");

Reviewed-by: Baochen Qiang <baochen.qiang@oss.qualcomm.com>


