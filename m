Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA27D606A31B
	for <ath12k@archiver.kernel.org>; Wed,  4 Nov 2026 02:26:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=lxEV1fQb;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=nuOhRHub;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=PsEl0FfR
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=+cU716QQkciKLnAv+AvMyJeOWBaGEIckc4N/C6sF0hc=; b=lxEV1fQbJrWQMt
	j93o1Lj6Y3wOVklstEFXlVv/ftSycvmVQDOKTEHZKroD+cBlqshCBWBlGqIfPpCkx2J/IV2X9L47N
	mzUw0OVG4STzn3gHLNO4JbnSE0sl9DBozpatuNVX+8cA6vS+2kfFb6YyDxTSJXN3m+Jpef4uC19wi
	lAuJESr4TwX7kZe2rj1svuJGeBqnR187/i0/XqkZZ5GNUBk26vRqYCHLyER56VjzvDZrECCXQyOWN
	jk4A8GA+uHI87Bu+Illc4clpeCY/fzea4QogRa7cnhStQlQ0eX1o+CFYRrdGLIutc8MBkr1xoiKBf
	dbGIksDxu0a+5Y1bn+2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOQho-000000049QI-2Nsg;
	Wed, 04 Nov 2026 02:26:28 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOQhl-000000049Px-3pYQ
	for ath12k@lists.infradead.org;
	Wed, 04 Nov 2026 02:26:27 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A40RYMs3867632
	for <ath12k@lists.infradead.org>; Wed, 4 Nov 2026 02:26:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+cU716QQkciKLnAv+AvMyJeOWBaGEIckc4N/C6sF0hc=; b=nuOhRHub3riCWUWA
	FzZpU9VxJ8prfCiOttOX3kQWvXl0LsTNEobz+SOTZUeE8ZImUlPiGisOAge3s1RG
	7k9DdYNpDy2+p2lWJ1UHCW7xmxRuvbCoxX6HT6x0tDwoFsW26F6VMUSGHbp6l/AH
	kph9onWSQcUv4oE1nAuCihc0mpIIr2QDCL6HCoWK+OUl4QPMdFgd3pFUFjHSUTIN
	wqAxyOSpB+MEKNWlFS7mlQJUK1xAQNiS+2CWtEkeQiSmtTV9cM+cxCiHuPcWpLp7
	vbro/I983LhEELLVNSyJUaGSgYNta3f+RaaLEIYQlqLC/2GzV8cx791nKJk6r1pL
	x7jn0A==
Received: from mail-dl1-f72.google.com (mail-dl1-f72.google.com [74.125.82.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hqn8y1g1e-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Wed, 04 Nov 2026 02:26:25 +0000 (GMT)
Received: by mail-dl1-f72.google.com with SMTP id a92af1059eb24-1b20a4b5f2bso383746c88.1
        for <ath12k@lists.infradead.org>; Tue, 03 Nov 2026 18:26:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793759184; x=1794363984; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=+cU716QQkciKLnAv+AvMyJeOWBaGEIckc4N/C6sF0hc=;
        b=PsEl0FfRM00PtovUSsh7WP9VtpwCNUCB/5o0d3cUatLBzUAQBxff0lNejKx4LJyOXg
         OT17z5iBCTdW0x4oq5rZLSGrHXdcoKSo28yljZSh2wldx7nPAem2z8+wKLY+RXdKS70f
         X8FUXBJD3Gwlmfs5W2JUIzBk/40tF6bnblRVyyx1b47yOEinGZtqg678I1d8/kqgvPzB
         QzXwaDYw0rXRtTmZsyx4CNqwtnJJ9Cx2lYk3okUYxocWmkct6eLaV6llyyMzpx/GkqtB
         6IKH2doNfaaW25Fw+2oWrrHeisH8NBLYW1N29rkAeMcwXncek33cexS40CGHDRC6vk+m
         0kyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793759184; x=1794363984;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+cU716QQkciKLnAv+AvMyJeOWBaGEIckc4N/C6sF0hc=;
        b=Sx7JUiV+RN+Dc0aszLcgah0Cay+f7qGDONvKZ5/+E8MYAUFQKhcv62gcT8KTGL1OsU
         /MPSMVnzXunlJ/2Vk932JdMun8FGYO19zGjIN7paQP44gZnW0UDjggvh2VMB9KXF34IU
         zZ7hzi1dLiDF9pGpFCJvwuofR7BLO922faUbc2kFchG1Hz3iSgJ4iCpCFLzliiFsv/mN
         gOi2SYx/W3E+gL6Acf+TFQrq5u32eGXUZH076LT6osl10+6cRrlCUYCFFf1x6tvUeRc2
         UxddwPMFeLy/2lL1qnmeLBhVpuCgzi3z+UveD67XUi5YuVHzeBL2HKicZLKIb5sMU5JK
         RL2Q==
X-Forwarded-Encrypted: i=1; AKwUvBxhNPPTiD1iWj/T+yGhOeBU6Dns7kkRHMg5dQyghC945HFW4armK4iZYbhpsVKOZQ0bJ3vovn4=@lists.infradead.org
X-Gm-Message-State: APuU4Z/dERdEIgb9+5YIa4DCBamLiEoGyl5kcgPJC0npgRx1aaALaJtk
	ct85gD0kx+e8XfOTzBjsT/4mego7sNgGsIbrWsJXcHEarkHQ9Gt0VUExTnqvdXoYc6TR6QVmGSn
	3Lwg9YQXePP736RM6AWysDigWpDvvVK9FhgaRKFz1HSZWZwjbk6GwQdazJ0I1H2H8
X-Gm-Gg: AYBFou3SpMVYBdaA54pY9WjuZTedmXKzjq0LY5ANCOQ9db0rVZ87SwRs/REKPpgcWku
	fJ+RbtYfbF/bwx9H+Co26iUzVbGHa00ge0wTKUeITUms2ZKA2uDOeoLhLFZTYBM/xuasMPethBk
	NCeFcfkCBJL+ThthCGDTGpN8DI7KA97eB2RO1jJiumtPQWY0d+vwb4P8SeqdGTQS0SadmX6iIiB
	oeBMcU0+fXmlXsTWEJgILcwrkL0Tj92WuTyzpFeD06dDvHBDMBN1UWvSoa5ts+X5V5PcRlkBYXF
	q566CW0ypLXLO60ET4mgiKjoJ96J0tFX0c8CvwSCVuFhuEN26QN0tqTcxa4cxWN40a23YT+LN3V
	5uzhsNsRX1mkgUKyeRLRO27Fx51l9ZklJq0cnNAxEaAeRrF/eDXxRQccZVfejWA0TAb2fqkRX63
	em6V1r3tO/YdyI6kgedSh6wdJPyU3HZQ==
X-Received: by 2002:a05:7023:a89:b0:1a8:9857:2102 with SMTP id a92af1059eb24-1ac5f183841mr23414812c88.30.1793759184324;
        Tue, 03 Nov 2026 18:26:24 -0800 (PST)
X-Received: by 2002:a05:7023:a89:b0:1a8:9857:2102 with SMTP id a92af1059eb24-1ac5f183841mr23414760c88.30.1793759183594;
        Tue, 03 Nov 2026 18:26:23 -0800 (PST)
Received: from [192.168.1.20] (33.sub-75-218-193.myvzw.com. [75.218.193.33])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b245ac2f44sm3519573c88.0.2026.11.03.18.26.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Nov 2026 18:26:22 -0800 (PST)
Message-ID: <ee2377e1-2722-4068-b4b6-44191b1b28dc@oss.qualcomm.com>
Date: Tue, 3 Nov 2026 18:26:20 -0800
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH ath-next v3 00/13] wifi: ath12k: ng: add Wi-Fi 8 REO
 command support
To: Pradeep Kumar Chitrapu <pradeep.chitrapu@oss.qualcomm.com>,
        Jeff Johnson <jjohnson@kernel.org>,
        Ripan Deuri <quic_rdeuri@quicinc.com>,
        Pavankumar Nandeshwar <quic_pnandesh@quicinc.com>,
        Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>,
        Baochen Qiang <baochen.qiang@oss.qualcomm.com>,
        ath12k-review@oss.qualcomm.com
Cc: linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        linux-kernel@vger.kernel.org
References: <20261103-reo-cmd-b4-posting-v3-0-861adf04b516@oss.qualcomm.com>
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20261103-reo-cmd-b4-posting-v3-0-861adf04b516@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: yMDF_q7eyZdcIWz0zQPMGafZpoEJV_GQ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA0MDAwOSBTYWx0ZWRfX/5A7ydFM3lPu
 voDCQwHBxEMwNWTV4ZavWEnMlWSHVQR1H8z5/W2Hvp4RH9PFnV0GdlafK0g7K61PJyDt5TVRGKd
 L1XYHkHzeEkBC9eCYXVFko6x0F68bpRTz2B1/IhHvNG2nJ4DElhCgM6anZvPGDZhtZdS9Qfj/w2
 wBIUsPVrMho3ECCdJxiWr/f60SCMj9SuqIWmaOfAi290E9dFIlTYrxl5o74HeRh2yomqegrEFOV
 UVfw/9Qis3O2tA8XNmEYUMAIWnpeeEZ8j8Hg6oU95MOmJS9/DdO8pHff8WfY7Ol8yObt3ITAs+N
 9aYf4NKSomLjDkhf055c1cDgwL/HXF0GiTZt5uhyFuHgrbb0+XBu/Ki0x3HVs3oGd3zFv3nxTf4
 eQAQG9qtuxH6mrgs/fwL0/CPOxCydpaIQemb+P++/tZQomhWLnlbhsO+27XqSamQHwai1ni+Puq
 8WZS/9v9xt5W4+vh79A==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA0MDAwOSBTYWx0ZWRfX/djeoUAwH0Xa
 LIahSsXRb7UOE5dx8cgC3G+OUP3yL1NCEc5eHWQ6LGkrBA55l4U3hg85/rFoZv5bmQMIajAYrae
 Dc7PHc+J5OGZ1qEMoMMUPg2acclWkmw=
X-Proofpoint-ORIG-GUID: yMDF_q7eyZdcIWz0zQPMGafZpoEJV_GQ
X-Authority-Analysis: v=2.4 cv=NP5AaE6g c=1 sm=1 tr=0 ts=6aea97d1 cx=c_pps
 a=bS7HVuBVfinNPG3f6cIo3Q==:117 a=AnolQpdaNwb4XK4FG+QP+g==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=bC-a23v3AAAA:8 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=COk6AnOGAAAA:8
 a=JfrnYn6hAAAA:8 a=VGIz9s3jmixilTPFgOsA:9 a=QEXdDO2ut3YA:10
 a=vBUdepa8ALXHeOFLBtFW:22 a=FO4_E8m0qiDe52t0p3_H:22 a=TjNXssC_j7lpFel5tvFf:22
 a=1CNFftbPRP8L7MoqJWF3:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-04_01,2026-11-03_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 bulkscore=0 suspectscore=0 adultscore=0
 phishscore=0 lowpriorityscore=0 malwarescore=0 spamscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611040009
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261103_182625_973568_21AD285F 
X-CRM114-Status: GOOD (  20.82  )
X-Spam-Score: -2.8 (--)
X-BeenThere: ath12k@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <ath12k.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/ath12k/>
List-Post: <mailto:ath12k@lists.infradead.org>
List-Help: <mailto:ath12k-request@lists.infradead.org?subject=help>
List-Subscribe: <https://lists.infradead.org/mailman/listinfo/ath12k>,
 <mailto:ath12k-request@lists.infradead.org?subject=subscribe>
Sender: "ath12k" <ath12k-bounces@lists.infradead.org>
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 11/3/2026 5:10 PM, Pradeep Kumar Chitrapu wrote:
> Add the Wi-Fi 8 REO command handling needed by the QCN9625 datapath.
> The series introduces the REO command and status descriptors, high
> priority REO command ring support, common command context handling, REO
> status processing, 1K queue statistics parsing, batched command sends,
> REO queue descriptor helpers, qaddr cache clear support and RX TID REO
> operation wiring.
> 
> The last patch fixes REO TID setup on Wi-Fi 8 global-peer-ID devices by
> using the host-allocated dp_peer id instead of the invalid link peer id
> when programming REO queue state.
> 
> The latest dependency postings found in local mail for this stack are:
> 
> Depends-on: [PATCH ath-next v4 00/12] wifi: ath12k: ng: refactor DP and HAL for multi-gen arch-ops
> Message-ID: <20261103163435.2682252-1-praneesh.p@oss.qualcomm.com>
> Depends-on: [PATCH ath-next v3 00/10] wifi: ath12k: ng: Add QCN9625 Wi-Fi 8 HAL register and descriptor definitions
> Message-ID: <20261030120743.2687216-1-praneesh.p@oss.qualcomm.com>
> Depends-on: [PATCH 0/4] wifi: ath12k: ng: Add SAM support for QCN9625
> Message-ID: <20260921090656.1575082-1-aishwarya.r@oss.qualcomm.com>
> 
> Signed-off-by: Pradeep Kumar Chitrapu <pradeep.chitrapu@oss.qualcomm.com>
> ---
> Changes in v3:
> - Update the cover letter dependency references to the latest versions
>   found in local mail: multi-gen arch-ops v4 and QCN9625 HAL/register
>   definitions v3.
> - Clean up the global-peer-ID fix by keeping only the wiphy-locked
>   dp_peer accessor needed by the series.
> - Make the dp_peer accessor typed and local to ath12k, and drop the
>   unused RCU accessor/export churn from the last patch.
> - Link to v2: https://patch.msgid.link/20261021-reo-cmd-b4-posting-v2-0-e8e3f482bfc9@oss.qualcomm.com
> 
> Changes in v2:
> - Use a lock-held helper for Wi-Fi 8 REO command queueing.
> - Document all-or-nothing SRNG pointer rollback for batched REO commands.
> - Use the shared Wi-Fi 8 REO queue-address LUT for qref updates.
> - Link to v1: https://patch.msgid.link/20260923-reo-cmd-b4-posting-v1-0-74935135a2de@oss.qualcomm.com
> 
> To: Jeff Johnson <jjohnson@kernel.org>
> To: Ripan Deuri <quic_rdeuri@quicinc.com>
> To: Pavankumar Nandeshwar <quic_pnandesh@quicinc.com>
> To: Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>
> To: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
> Cc: linux-wireless@vger.kernel.org
> Cc: ath12k@lists.infradead.org
> Cc: linux-kernel@vger.kernel.org
> Cc: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
> 
> ---
> Pradeep Kumar Chitrapu (13):
>       wifi: ath12k: ng: add REO command and status support
>       wifi: ath12k: ng: add high-priority REO command ring
>       wifi: ath12k: ng: allocate REO command context before submission
>       wifi: ath12k: ng: refactor REO command framework for extensibility
>       wifi: ath12k: ng: log successful RX TID queue updates
>       wifi: ath12k: ng: parse 1K REO queue statistics
>       wifi: ath12k: ng: process REO status ring
>       wifi: ath12k: ng: add batched REO command sends
>       wifi: ath12k: ng: add REO queue descriptor helpers
>       wifi: ath12k: ng: add REO qaddr cache clear support
>       wifi: ath12k: ng: add RX TID REO helpers
>       wifi: ath12k: ng: wire RX TID REO operations
>       wifi: ath12k: ng: use global dp peer id for REO TID setup
> 
>  drivers/net/wireless/ath/ath12k/core.h             |   2 +
>  drivers/net/wireless/ath/ath12k/dp.c               |  10 +-
>  drivers/net/wireless/ath/ath12k/dp.h               |  15 +-
>  drivers/net/wireless/ath/ath12k/dp_cmn.h           |   6 +
>  drivers/net/wireless/ath/ath12k/dp_peer.c          |  14 +
>  drivers/net/wireless/ath/ath12k/dp_peer.h          |   4 +-
>  drivers/net/wireless/ath/ath12k/dp_rx.c            | 138 +++-
>  drivers/net/wireless/ath/ath12k/dp_rx.h            |  20 +-
>  drivers/net/wireless/ath/ath12k/hal.h              | 103 +++
>  drivers/net/wireless/ath/ath12k/mac.c              |  15 +-
>  drivers/net/wireless/ath/ath12k/wifi7/dp_rx.c      |  63 +-
>  drivers/net/wireless/ath/ath12k/wifi7/dp_rx.h      |   4 +-
>  drivers/net/wireless/ath/ath12k/wifi7/hal.h        |  94 +--
>  drivers/net/wireless/ath/ath12k/wifi8/dp.c         |  28 +
>  drivers/net/wireless/ath/ath12k/wifi8/dp.h         |   1 +
>  drivers/net/wireless/ath/ath12k/wifi8/dp_peer.c    |  16 +-
>  drivers/net/wireless/ath/ath12k/wifi8/dp_rx.c      | 643 +++++++++++++++-
>  drivers/net/wireless/ath/ath12k/wifi8/dp_rx.h      |  57 ++
>  drivers/net/wireless/ath/ath12k/wifi8/hal.c        |  16 +-
>  drivers/net/wireless/ath/ath12k/wifi8/hal.h        |   3 +
>  drivers/net/wireless/ath/ath12k/wifi8/hal_desc.h   | 377 +++++++++-
>  .../net/wireless/ath/ath12k/wifi8/hal_qcn9625.c    |   1 +
>  drivers/net/wireless/ath/ath12k/wifi8/hal_rx.c     | 813 +++++++++++++++++++++
>  drivers/net/wireless/ath/ath12k/wifi8/hal_rx.h     | 103 ++-
>  drivers/net/wireless/ath/ath12k/wifi8/hal_tx.h     |   9 +
>  drivers/net/wireless/ath/ath12k/wifi8/hw.c         |   1 +
>  26 files changed, 2347 insertions(+), 209 deletions(-)
> ---
> base-commit: a2fa01354eb39e673f3f09e6c1cec39f82f0f9ae
> change-id: 20260923-reo-cmd-b4-posting-af227314a3b5
> prerequisite-patch-id: 49882cc69530a316a86f617b0b8649c3e753fc39
> prerequisite-patch-id: 6fe238c82896b9f8b39fa0f09e32fb72d82ea6e1
> prerequisite-patch-id: f09a16b2b6b388cb3290a14d86f4fbe370929680
> prerequisite-patch-id: f7fab6336752c5a6e2e45221157c05a2845b1057
> 
> Best regards,
> --  
> Pradeep Kumar Chitrapu <pradeep.chitrapu@oss.qualcomm.com>

All,
This was only supposed to go to the Qualcomm internal list since this is work
in progress.  Please ignore.

/jeff

