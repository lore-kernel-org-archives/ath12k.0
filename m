Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4CA05D767C3
	for <ath12k@archiver.kernel.org>; Fri, 19 Dec 2025 10:47:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ohuBcRpV8beJcWGlYizxYN54dm2bkbetXdev9n84fy4=; b=kqPszLkto4NoLYoQ7V5uvjmCN3
	xXza4qKocLVXJmSs77t9kivqHzeHKfyylrtSPcvIE7d9Y+x+1F/rwDm/N1aYwonRXreMuwW0ptPFS
	aa8dab72jSagq0LTc1+Zs9uSQNyiAbBGDRM28LuWqBZJNtbqTHJoIGUHmZ1CTA9YxKq7nIR07gELh
	YPKf06g++Z8IU0OkIf/LqMSF25lAhkvruNlfeLLPAJJ96Z1fsCuGb0c7kWFAhOXOXLRywzpBrTN4c
	iZuPPhDTNuelH4i6QPskrXSFjZXzuJ5NoDmOK0lBFwHYZ3cu98k30Sv2WnfYY5ZAW2FxFuiD/WuOq
	l44r+ZoQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWY1O-0000000A9JQ-0HBH;
	Fri, 19 Dec 2025 10:47:42 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWY1I-0000000A9IX-3ohg
	for ath12k@lists.infradead.org;
	Fri, 19 Dec 2025 10:47:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1766141255;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ohuBcRpV8beJcWGlYizxYN54dm2bkbetXdev9n84fy4=;
	b=dC2TE71J+YfHJewG58FwvcxeKkgfTh93hutbdh9GkWS3cPBgcoFmRCuDrbZk0Q7QNWVDNu
	0hn5R/RNi1GJ0zfJQYFs9w5HxadAT5iCjAGYSjZ4ABN5ubVF77pMXLoBqjBDwXDTIP93qG
	EX4zAKm9pvl4/Icv8FpiDVEFCACKE9o=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-1-AR2hGdxBMBSDHE_2kwdQmQ-1; Fri, 19 Dec 2025 05:47:33 -0500
X-MC-Unique: AR2hGdxBMBSDHE_2kwdQmQ-1
X-Mimecast-MFC-AGG-ID: AR2hGdxBMBSDHE_2kwdQmQ_1766141252
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-4792bd2c290so15115625e9.1
        for <ath12k@lists.infradead.org>; Fri, 19 Dec 2025 02:47:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766141252; x=1766746052;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ohuBcRpV8beJcWGlYizxYN54dm2bkbetXdev9n84fy4=;
        b=h1KlcnDNASAZStcur9UUCJGFQq8t8KZSMqPhJsZX0wWSKr/7d6STPQVbGNG9LzUPoL
         gBd5K8ILi3K+xOULPziz2wIzqeN3rj33ycPTXPKXtfOE0RoJkOk6eFWlCE2LFyeBB7mb
         l00iKcW+p94cU62hllSfnbjLpo8FfZZr77BZe4P7xEQ3ns/ViWte3t8XeF9rrRXiJRxY
         mafgTk2jE2+sgid8/ADIH+4VmRSXqYooM9U9IstZEV4/z65oyIXU1cXLb5d5B06w6m05
         teCVozVWSTA7oe6knJ/RRpDTSgDEQb26ZBTH4tyb7Q5AACPDCXzUpmXumVZmUFv4xVmV
         trhA==
X-Forwarded-Encrypted: i=1; AJvYcCUaT1m7zZ0yHP+/nZmGdpDU4mqhaR+eWOTxK0ZipzZzZ5u2PnIozY1go8lOj9smjOpvyVP9hDY=@lists.infradead.org
X-Gm-Message-State: AOJu0YxFTr5G3OjW3+tQR/LKQtlh/p9Sld6lzgs/5cQGPb/Afbe7/y5d
	0Dv/Q7hiuBecsOw35PGEtKr73ktlh7fZO5Po/wSeyv9T/jfd/Ot//s7vSnw7g5EuPFUmIPxVJtL
	NP/oAKkhgvmQfWR1i6FGplAuBy2ePsEokTDVjlR6RbWpCyPN5dXcWkhxkIqyFnXI=
X-Gm-Gg: AY/fxX5d+5H4FpA2gaTgh2hAcChhV1sXMTpSyLwn6gJH+1THnP1kO7dDsiFgWzX/1Np
	A3znehHnZwyDlKWR9ceGSgXe59VeHcW8DbFKHNo06T4rIVUUTaF49lyZy1yiK6R7W7cPpxlolpw
	ohJnnzqIxbir19U0Xcimr9kdkTK0oIz3VUI4AJtl3wkTks3FzjLUHQNqIf8RIXuRRlgkN6McePY
	OlZJLMywlFW/TCNhS/syvQj6YNtoovwz81z/0aJv2FwN6od9wuY1shlPEFA1a4cQodx1tEMqxRy
	AIfNjpuTpH2VqLzsCSxle5dN75g1VBqHkCPWIlBLu+4To3Thf4l4dhV7KsjES7qQOyU7XDbe+0f
	WSQFEZmgvr95U
X-Received: by 2002:a05:600c:6812:b0:477:63b5:7148 with SMTP id 5b1f17b1804b1-47d1955b97cmr21387425e9.6.1766141252217;
        Fri, 19 Dec 2025 02:47:32 -0800 (PST)
X-Google-Smtp-Source: AGHT+IG0haeKdz6e1wVUfU68PetlUVJ262uD0U3xuzOT7CFHMjUWuxjHWC2bHGvwH3+5rKwg5RCnYg==
X-Received: by 2002:a05:600c:6812:b0:477:63b5:7148 with SMTP id 5b1f17b1804b1-47d1955b97cmr21387045e9.6.1766141251798;
        Fri, 19 Dec 2025 02:47:31 -0800 (PST)
Received: from [192.168.88.32] ([216.128.11.227])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47be273f147sm92155575e9.7.2025.12.19.02.47.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 19 Dec 2025 02:47:31 -0800 (PST)
Message-ID: <b547252f-9893-4c23-8b17-9808c8bdd0c9@redhat.com>
Date: Fri, 19 Dec 2025 11:47:28 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] net: qrtr: Drop the MHI auto_queue feature for
 IPCR DL channels
To: manivannan.sadhasivam@oss.qualcomm.com,
 Jeff Hugo <jeff.hugo@oss.qualcomm.com>,
 Carl Vanderlip <carl.vanderlip@oss.qualcomm.com>,
 Oded Gabbay <ogabbay@kernel.org>, Manivannan Sadhasivam <mani@kernel.org>,
 Jeff Johnson <jjohnson@kernel.org>, "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Simon Horman <horms@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Loic Poulain <loic.poulain@oss.qualcomm.com>,
 Maxim Kochetkov <fido_max@inbox.ru>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, mhi@lists.linux.dev,
 linux-wireless@vger.kernel.org, ath11k@lists.infradead.org,
 ath12k@lists.infradead.org, netdev@vger.kernel.org,
 Bjorn Andersson <andersson@kernel.org>, Johan Hovold <johan@kernel.org>,
 Chris Lew <quic_clew@quicinc.com>, stable@vger.kernel.org
References: <20251218-qrtr-fix-v2-0-c7499bfcfbe0@oss.qualcomm.com>
 <20251218-qrtr-fix-v2-1-c7499bfcfbe0@oss.qualcomm.com>
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <20251218-qrtr-fix-v2-1-c7499bfcfbe0@oss.qualcomm.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: Pl-LL0O5i9slzK6EJZW3KtnPq5QiuWvzOG3xKYOliGc_1766141252
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251219_024737_031685_09DBBE7A 
X-CRM114-Status: GOOD (  15.39  )
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

On 12/18/25 5:51 PM, Manivannan Sadhasivam via B4 Relay wrote:
> From: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
> 
> MHI stack offers the 'auto_queue' feature, which allows the MHI stack to
> auto queue the buffers for the RX path (DL channel). Though this feature
> simplifies the client driver design, it introduces race between the client
> drivers and the MHI stack. For instance, with auto_queue, the 'dl_callback'
> for the DL channel may get called before the client driver is fully probed.
> This means, by the time the dl_callback gets called, the client driver's
> structures might not be initialized, leading to NULL ptr dereference.
> 
> Currently, the drivers have to workaround this issue by initializing the
> internal structures before calling mhi_prepare_for_transfer_autoqueue().
> But even so, there is a chance that the client driver's internal code path
> may call the MHI queue APIs before mhi_prepare_for_transfer_autoqueue() is
> called, leading to similar NULL ptr dereference. This issue has been
> reported on the Qcom X1E80100 CRD machines affecting boot.
> 
> So to properly fix all these races, drop the MHI 'auto_queue' feature
> altogether and let the client driver (QRTR) manage the RX buffers manually.
> In the QRTR driver, queue the RX buffers based on the ring length during
> probe and recycle the buffers in 'dl_callback' once they are consumed. This
> also warrants removing the setting of 'auto_queue' flag from controller
> drivers.
> 
> Currently, this 'auto_queue' feature is only enabled for IPCR DL channel.
> So only the QRTR client driver requires the modification.
> 
> Fixes: 227fee5fc99e ("bus: mhi: core: Add an API for auto queueing buffers for DL channel")
> Fixes: 68a838b84eff ("net: qrtr: start MHI channel after endpoit creation")
> Reported-by: Johan Hovold <johan@kernel.org>
> Closes: https://lore.kernel.org/linux-arm-msm/ZyTtVdkCCES0lkl4@hovoldconsulting.com
> Suggested-by: Chris Lew <quic_clew@quicinc.com>
> Acked-by: Jeff Johnson <jjohnson@kernel.org> # drivers/net/wireless/ath/...
> Cc: stable@vger.kernel.org
> Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>

For net/...

Acked-by: Paolo Abeni <pabeni@redhat.com>

even if I don't see anything network specific there.

/P


